
import 'dart:io';

import 'package:smsrly/models/user.dart';

abstract class Repository{
  Future<String> signInWithEmailAndPassword(String email,String password);
  Future<String> signUp(User user,String password,File? file);
  void setSeenOnBoarding();
  bool hasSeenOnBoarding();
  bool hasUserSignedInBefore();
  String signInWithGoogle();
}