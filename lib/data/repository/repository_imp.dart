import 'package:smsrly/domain/repository/repository.dart';

import '../../res/strings.dart';
import '../local/local_service.dart';
import '../network/auth_service.dart';

class RepositoryImp implements Repository {

  late AuthService _authService;
  late LocalService _localService;

  void setLocalService(LocalService localService){
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
    if(response['statue'] == StringManager.success && response['message'] != StringManager.apiLoginSuccess){
      return response['message'];
    }
    return response['result'];
  }

  @override
  void setSeenOnBoarding() async {
    _localService.setSeenOnBoarding();
  }

  @override
  bool hasSeenOnBoarding(){
    return _localService.hasSeenOnBoarding();
  }

  @override
  bool hasUserSignedInBefore(){
    return _localService.getToken() != null;
  }

  @override
  String signInWithGoogle() {
    return "";
  }
}
