import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:smsrly/models/realestate.dart';
import 'package:smsrly/models/user_info.dart';
import 'package:smsrly/res/strings.dart';

import '../../models/user.dart';
import 'api_constants.dart';

class ApiServices {
  Future<dynamic> getSignInResponse(String email, String password) async {
    try {
      String body = jsonEncode({'email': email, 'password': password});
      print('body = $body');
      print('api url => ${ApiConstants.baseUrl + ApiConstants.loginEndPoint}');

      var res12 = await http
          .post(
            Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndPoint),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: body,
          )
          .timeout(const Duration(seconds: 10));

      final res = returnResponse(res12);
      return res;
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> signUpResponse(User user, String password) async {
    try {
      var body = user.toMap();
      body['password'] = password;
      final bodyR = jsonEncode(body);
      final response = await http
          .post(Uri.parse(ApiConstants.baseUrl + ApiConstants.registerEndPoint),
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              body: bodyR)
          .timeout(const Duration(seconds: 20));
      print(response.body);
      return returnResponse(response);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> uploadUserImage(String email, File file) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            ApiConstants.baseUrl + ApiConstants.userRegisterImageEndPoint));
    request.files.add(await http.MultipartFile.fromPath('image', file.path,
        contentType: MediaType('image', 'jpeg')));

    request.fields['email'] = email;

    final response = await request.send();
    final res = await http.Response.fromStream(response);

    return returnResponse(res);
  }

  Future<dynamic> verifyCode(String email, String code) async {
    final params = {'email': email, 'code': code};
    try {
      final response = await http.get(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.confirmEmailEndPoint)
            .replace(queryParameters: params),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      return returnResponse(response);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> sendResetCodeRequest(String email) async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.resetPasswordEndPoint)
            .replace(queryParameters: {'email': email}),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      return returnResponse(response);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getSignInWithGoogleResponse(
      String firstName, String lastName, String email, String? imageUrl) async {
    try {
      String body = jsonEncode({
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'imageURL': imageUrl
      });
      var response = await http
          .post(
            Uri.parse(
                ApiConstants.baseUrl + ApiConstants.loginWithGoogleEndPoint),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: body,
          )
          .timeout(const Duration(seconds: 10));

      final res = returnResponse(response);
      return res;
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> checkResetPasswordCode(String email, String code) async {
    try {
      final response = await http
          .get(Uri.parse(ApiConstants.baseUrl +
                  ApiConstants.submitResetPasswordCodeEndPoint)
              .replace(queryParameters: {'email': email, 'code': code}))
          .timeout(const Duration(seconds: 15));
      return returnResponse(response);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> changePassword(String token, String password) async {
    try {
      final response = await http.put(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.updatePasswordEndPoint)
              .replace(queryParameters: {'password': password}),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }).timeout(const Duration(seconds: 15));
      return returnResponse(response);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getUser(String token) async {
    try {
      final response = await http.get(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.getUserEndPoint),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }).timeout(const Duration(seconds: 20));
      print('response code => ${response.statusCode}');
      print('response body => ${response.body}');
      if (response.statusCode == 200) {
        return User.formJson(jsonDecode(response.body));
      } else if (response.statusCode == 403) {
        return StringManager.tokenNotWork;
      } else {
        return null;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getRealEstates(String token) async {
    try {
      print('before');
      final response = await http.get(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.realEstatesEndPoint),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }).timeout(const Duration(seconds: 15));
      List<RealEstate> elements = [];
      Map<int,RealEstate> elementsMap = {};
      var responseBody = jsonDecode(response.body);
      for (var item in responseBody) {
        List<String> urls = [];
        for (var link in item['realEstateImages']) {
          urls.add(link['realEstateImageURL']);
        }
        var currItem =
            RealEstate.fromJson(Map<String, dynamic>.from(item), urls);
        print('currItem => $currItem');
        elementsMap[currItem.realEstateId!] = currItem;
        elements.add(elementsMap[currItem.realEstateId]!);
      }
      return {
        StringManager.itemsMap : elementsMap,
        StringManager.itemsList : elements
      };
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> saveRealEstate(String token, int realEstateId) async {
    try {
      final response = await http.post(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.savesEndPoint)
              .replace(queryParameters: {'RealEstateId': "$realEstateId"}),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }).timeout(const Duration(seconds: 2));
      return returnResponse(response);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> unSaveRealEstate(String token, int realEstateId) async {
    try {
      final response = await http.delete(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.savesEndPoint)
              .replace(queryParameters: {'RealEstateId': "$realEstateId"}),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }).timeout(const Duration(seconds: 2));
      return returnResponse(response);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getUploads(String token) async {
    try {
      final res = await http.get(
          Uri.parse(ApiConstants.baseUrl +
              ApiConstants.uploadedRealEstatesOfUserEndPoint),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }).timeout(const Duration(seconds: 20));
      var responseBody = jsonDecode(res.body) as List<dynamic>;
      if (res.statusCode == 200) {
        List<RealEstate> realEstates = [];
        for (var element in responseBody) {
          element = element as Map<String, dynamic>;
          List<String> urls = [];
          for (var link in element['realEstateImages']) {
            urls.add(link['realEstateImageURL']);
          }
          print('element => $element');
          realEstates.add(RealEstate.fromJson(element, urls));
        }
        return realEstates;
      } else {
        return returnResponse(res);
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> requestRealEstate(String token, int realEstateId) async {
    try {
      final response = await http.post(
          Uri.parse(ApiConstants.baseUrl +
                  ApiConstants.requestedRealEstatesOfUserEndPoint)
              .replace(queryParameters: {'RealEstateId': "$realEstateId"}),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }).timeout(const Duration(seconds: 2));
      return returnResponse(response);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> deleteRequestRealEstate(
      String token, int realEstateId) async {
    try {
      final response = await http.delete(
          Uri.parse(ApiConstants.baseUrl +
                  ApiConstants.requestedRealEstatesOfUserEndPoint)
              .replace(queryParameters: {'RealEstateId': "$realEstateId"}),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }).timeout(const Duration(seconds: 2));
      return returnResponse(response);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> deleteRealEstate(String token, int id) async {
    try {
      final res = await http.delete(
          Uri.parse(
              '${ApiConstants.baseUrl}${ApiConstants.realEstatesEndPoint}/$id'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
      return returnResponse(res);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getRealEstateRequests(String token, int id) async {
    try {
      final res = await http.get(
          Uri.parse(ApiConstants.baseUrl +
                  ApiConstants.realEstateRequestsEndPoint)
              .replace(queryParameters: {'RealEstateId': '$id'}),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
      if (res.statusCode == 200) {
        final resBody = jsonDecode(res.body);
        List<UserInfo> userInfo = [];
        for (var item in resBody) {
          userInfo.add(
            UserInfo(
                name: '${item['user']['firstName']} ${item['user']['lastName']}',
                phoneNumber: '+${item['phoneNumber']}',
                imageUrl: item['imageURL']
            )
          );
        }
        return userInfo;
      } else {
        return returnResponse(res);
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getUserRequests(String token) async {
    try{
      final response = await http.get(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.requestedRealEstatesOfUserEndPoint),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }
      );
      if(response.statusCode == 200){
        final responseBody = jsonDecode(response.body);
        List<RealEstate> realEstates = [];
        for (var element in responseBody) {
          element = element as Map<String, dynamic>;
          List<String> urls = [];
          for (var link in element['realEstateImages']) {
            urls.add(link['realEstateImageURL']);
          }
          realEstates.add(RealEstate.fromJson(element, urls));
        }
        return realEstates;
      } else {
        return returnResponse(response);
      }
    }catch(e){
      return e.toString();
    }
  }

  Future<dynamic> getUserSaves(String token) async {
    try{
      final response = await http.get(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.savesEndPoint),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }
      );
      if(response.statusCode == 200){
        final responseBody = jsonDecode(response.body);
        List<RealEstate> realEstates = [];
        for (var element in responseBody) {
          element = element as Map<String, dynamic>;
          List<String> urls = [];
          for (var link in element['realEstateImages']) {
            urls.add(link['realEstateImageURL']);
          }
          realEstates.add(RealEstate.fromJson(element, urls));
        }
        return realEstates;
      } else {
        return returnResponse(response);
      }
    }catch(e){
      return e.toString();
    }
  }


  Future<dynamic> uploadRealEstate(String token, RealEstate realEstate) async {
    try {
      String body = jsonEncode(realEstate.toMap());
      final response = await http
          .post(
          Uri.parse(
              ApiConstants.baseUrl + ApiConstants.realEstatesEndPoint),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          },
          body: body)
          .timeout(const Duration(seconds: 30));
      print('response code => ${response.statusCode}');
      print('response body => ${response.body}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 403) {
        return StringManager.tokenNotWork;
      } else {
        return returnResponse(response);
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> uploadRealEstateImages(
      List<File> files, int realEstateId) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            ApiConstants.baseUrl + ApiConstants.realEstateImagesEndPoint));

    request.fields['RealEstateId'] = realEstateId.toString();

    for (var i = 0; i < files.length; i++) {
      var file = await http.MultipartFile.fromPath('image', files[i].path,
          contentType: MediaType('image', 'jpeg'));
      request.files.add(file);
    }

    var response = await request.send();
    return returnResponse(await http.Response.fromStream(response));
  }

  Future expireToken(String token) async {
    await http
        .post(Uri.parse(ApiConstants.baseUrl + ApiConstants.logout), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });
  }

  Future deleteAccount(String token) async {
    try{
      final res = await http.delete(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.getUserEndPoint),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
      return returnResponse(res);
    }catch(e){
      return e.toString();
    }

  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        return "400 Bad Request ${response.body.toString()}";
      case 401:
        return "401 UnAuthorized ${response.body.toString()}";
      default:
        return "Error occurred while communicating with server with status code ${response.statusCode.toString()}";
    }
  }
}
