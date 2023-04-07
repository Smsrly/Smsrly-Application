import 'package:flutter/foundation.dart';
import 'package:smsrly/utils/utils.dart';

import '../domain/use_cases/user_use_cases/code_verification_use_case/code_verification_use_case.dart';
import '../main.dart';
import '../res/strings.dart';

class VerificationViewModel with ChangeNotifier {
  VerificationUseCase? _verificationUseCase;
  bool isLoading = false;
  String? _email;

  set email(String em) {
    _email = em;
  }

  void checkVerificationCode(String code, Function() onSuccess) async {
    if (!isLoading) {
      isLoading = true;
      notifyListeners();
      _verificationUseCase ??= VerificationUseCase(repository!);
      final res =
          await _verificationUseCase!.sendVerificationCode(_email!, code);
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
