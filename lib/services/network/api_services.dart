import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smsrly/services/network/api_constants.dart';

class ApiServices {
  Future<dynamic> getSignInResponse(
      String email, String password) async {
    try{
      String body =jsonEncode({'email': email, 'password': password});
      print('body = $body');
      print('api url => ${ApiConstants.baseUrl + ApiConstants.loginEndPoint}');

      var res12 = await http.post(Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndPoint),
          body: body).timeout(const Duration(seconds: 10));

      print('res12 = ${res12.contentLength}');
      print('res12 = ${res12.body}');

      final res = returnResponse(
          await http.post(Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndPoint),
          body: body).timeout(const Duration(seconds: 10))
      );
      print('res : $res');

      return res;
    }catch(e){
      print(e.toString());
      return "No Internet Connection";
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
