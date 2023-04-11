import 'dart:ui';

import 'package:smsrly/domain/repository/repository.dart';
import 'package:smsrly/models/user.dart';

import '../../../../res/strings.dart';

class GetUserDataUseCase {
  Repository repository;

  GetUserDataUseCase(this.repository);

  Future<User?> getUserData(VoidCallback onTokenExpiration) async {
    print('asdasdf');
    final res = await repository.getUser();
    if (res is User) {
      return res;
    }
    if (res == StringManager.tokenNotWork) {
      onTokenExpiration();
    }
    return null;
  }
}
