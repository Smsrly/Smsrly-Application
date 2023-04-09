import 'dart:io';

import 'package:smsrly/domain/repository/repository.dart';
import 'package:smsrly/models/user.dart';

import '../../res/strings.dart';
import '../local/local_service.dart';
import '../network/auth_service.dart';

class RepositoryImp implements Repository {
  late AuthService _authService;
  late LocalService _localService;

  void setLocalService(LocalService localService) {
    _localService = localService;
  }

  RepositoryImp() {
    _authService = AuthService();
  }

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    final response =
        await _authService.signInUsingEmailAndPassword(email, password);
    if (response['statue'] == StringManager.success &&
        response['message'] == StringManager.apiLoginSuccess) {
      _localService.saveToken(response['token']);
      return StringManager.success;
    }
    if (response['statue'] == StringManager.success &&
        response['message'] != StringManager.apiLoginSuccess) {
      return response['message'];
    }
    return response['result'];
  }

  @override
  Future<String> signUp(User user, String password, File? file) async {
    final response = await _authService.signUp(user, password, file);
    if (response['statue'] == StringManager.success) {
      return response['message'];
    } else {
      return response['result'];
    }
  }

  @override
  Future<String> checkVerificationCode(String email, String code) async {
    final res = await _authService.checkVerifyCode(email, code);
    if (res['statue'] == StringManager.success &&
        res['message'] == 'activated') {
      print('Going To save token => ${res['token']}');
      _localService.saveToken(res['token']);
      return StringManager.verifyMessage;
    } else if (res['statue'] == StringManager.fail && res['message'] != null) {
      return res['message'];
    }

    return res['result'];
  }

  @override
  void setSeenOnBoarding() async {
    _localService.setSeenOnBoarding();
  }

  @override
  bool hasSeenOnBoarding() {
    return _localService.hasSeenOnBoarding();
  }

  @override
  bool hasUserSignedInBefore() {
    return _localService.getToken() != null;
  }

  @override
  Future<String> signInWithGoogle(
      String firstName, String lastName, String email, String? imageUrl) async {
    final response = await _authService.signInUsingGoogle(
        firstName, lastName, email, imageUrl);
    if (response['statue'] == StringManager.success &&
        response['message'] == StringManager.apiLoginSuccessfully) {
      _localService.saveToken(response['token']);
      return StringManager.success;
    }
    if (response['statue'] == StringManager.success &&
        response['message'] != StringManager.apiLoginSuccessfully) {
      return response['message'];
    }
    return response['result'];
  }

  @override
  Future<String> sendResetPasswordCodeRequest(String email) async {
    final res = await _authService.sendResetCodeRequest(email);
    if (res['statue'] == StringManager.success &&
        res['message'] == StringManager.successResetPassMessage) {
      return StringManager.successResetCodeMessage;
    }
    if (res['statue'] == StringManager.success &&
        res['message'] != StringManager.successResetPassMessage) {
      return res['message'];
    }
    return res['result'];
  }
}
