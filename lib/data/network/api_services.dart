import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


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

  Future<dynamic> signUpResponse(User user,String password) async {
    try {
      var body = user.toMap();
      body['password'] = password;
      final bodyR = jsonEncode(body);
      final response = await http
          .post(Uri.parse(ApiConstants.baseUrl + ApiConstants.registerEndPoint),
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              body: bodyR)
          .timeout(const Duration(seconds: 10));
      print(response.body);
      return returnResponse(response);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> uploadUserImage(String email, File file) async {

    var request = http.MultipartRequest(
        'POST',
        Uri.parse(ApiConstants.baseUrl + ApiConstants.userRegisterImageEndPoint)
    );
    request.files.add(await http.MultipartFile.fromPath(
        'image', file.path,
        contentType: MediaType('image', 'jpeg')
    ));

    request.fields['email'] = email;

    final response = await request.send();
    final res = await http.Response.fromStream(response);

    return returnResponse(res);
  }

  Future<dynamic> verifyCode(
      String email,
      String code
      )async{
    final params = {
      'email':email,
      'code':code
    };
    try{
      final response = await http.get(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.confirmEmailEndPoint).replace(
            queryParameters: params
        ),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      return returnResponse(response);
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
