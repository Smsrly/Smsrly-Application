import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:smsrly/models/realestate.dart';
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
    try{
      final response = await http.get(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.getUserEndPoint),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }).timeout(const Duration(seconds: 20));
      print('response code => ${response.statusCode}');
      print('response body => ${response.body}');
      if(response.statusCode == 200){
        return User.formJson(jsonDecode(response.body));
      } else if(response.statusCode == 403) {
        return StringManager.tokenNotWork;
      } else {
        return null;
      }
    }catch(e){
      return e.toString();
    }
  }

  Future<dynamic> getRealEstates(String token)async{
    try{

      final response = await http.get(
          Uri.parse(ApiConstants.baseUrl + ApiConstants.realEstatesEndPoint),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }
      ).timeout(const Duration(seconds: 15));
      List<RealEstate> elements = [];
      var responseBody = jsonDecode(response.body);

      for(var item in responseBody){
        elements.add(RealEstate.fromJson(Map<String,dynamic>.from(item)));
      }
      return elements;
    }catch(e){
      return e.toString();
    }

  }
  Future<dynamic> uploadRealEstateImages(List<File> images, int realEstateId) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(''),
    );

    request.fields['RealEstateId'] = realEstateId.toString();

    for (var i = 0; i < images.length; i++) {
      var file = await http.MultipartFile.fromPath('image', images[i].path);
      request.files.add(file);
    }

    var response = await request.send();
    return returnResponse(await http.Response.fromStream(response));
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
