import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

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

  Future<dynamic> signUpResponse(
      String firstName,
      String secondName,
      String email,
      String password,
      String phoneNumber,
      double latitude,
      double longitude
      ) async {

  }

  Future<dynamic> uploadImage(String url, File file) async {

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
