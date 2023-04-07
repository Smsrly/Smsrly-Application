
import 'package:smsrly/data/local/local_service.dart';

abstract class Repository{
  Future<String> signInWithEmailAndPassword(String email,String password);
  void setSeenOnBoarding();
  bool hasSeenOnBoarding();
  bool hasUserSignedInBefore();
  String signInWithGoogle();
}