import 'package:flutter/cupertino.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/utils/utils.dart';

import '../domain/use_cases/user_use_cases/get_user_data/get_user_data_use_case.dart';
import '../main.dart';

class SplashViewModel with ChangeNotifier{
  User? user = null;
  Future<bool> onStart() async {
    if(user == null){
      GetUserDataUseCase useCase = GetUserDataUseCase(repository!);
      final user = await useCase.getUserData(() {
        Utils.showToast('something went wrong', 1);
      });
      if (user != null) {
        this.user = user;
        return true;
      }
      return false;
    }
    return true;
  }

}