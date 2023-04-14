import 'package:flutter/foundation.dart';
import 'package:smsrly/domain/repository/user_repository.dart';
import 'package:smsrly/utils/utils.dart';

import '../domain/use_cases/user_use_cases/code_verification_use_case/code_verification_use_case.dart';
import '../res/strings.dart';

class VerificationViewModel with ChangeNotifier {
  UserRepository userRepository;
  late VerificationUseCase _verificationUseCase;

  VerificationViewModel(this.userRepository){
    _verificationUseCase = VerificationUseCase(userRepository);
  }

  bool isLoading = false;
  String? _email;

  set email(String em) {
    _email = em;
  }

  void checkVerificationCode(String code, Function() onSuccess) async {
    if (!isLoading) {
      isLoading = true;
      notifyListeners();
      final res =
          await _verificationUseCase.sendVerificationCode(_email!, code);
      if (res == StringManager.verifyMessage) {
        onSuccess();
      }else{
        Utils.showToast(res, 1);
      }
      isLoading = false;
      notifyListeners();
    }
  }
}
