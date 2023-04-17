
import 'dart:io';

import 'package:smsrly/models/user.dart';

abstract class UserRepository {
  Future<String> signInWithEmailAndPassword(String email,String password);
  Future<String> signUp(User user,String password,File? file);
  Future<String> checkVerificationCode(String email, String code);
  Future<String> sendResetPasswordCodeRequest(String email);
  Future<dynamic> checkResetPasswordCode(String email, String code);
  Future<dynamic> getUser();
  Future<dynamic> logout();
  Future<String> resetPassword(String token, String password);
  void setSeenOnBoarding();
  bool hasSeenOnBoarding();
  bool hasUserSignedInBefore();
  Future<String> signInWithGoogle(String firstName, String lastName, String email, String? imageUrl) ;
}