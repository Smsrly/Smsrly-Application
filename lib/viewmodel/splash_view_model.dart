import 'package:flutter/cupertino.dart';
import 'package:smsrly/models/realestate.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/utils/utils.dart';

import '../domain/use_cases/user_use_cases/get_user_data/get_user_data_use_case.dart';
import '../main.dart';

class SplashViewModel with ChangeNotifier{
  User? user;
  List<RealEstate>? realEstateItems;
  Future<bool> onStart() async {
    await getData();
    return user != null && realEstateItems != null;
  }

  Future getData() async {
    final user = await _getUser();
    if (user != null) {
      this.user = user;
    }
    print('asf');
    final items = await realEstateRepository?.getRealEstates();
    print('items ===> $items');
    print('asf');
    try{
      if(items is List<RealEstate>){
        realEstateItems = items;
        print(items);
      }
    }catch(e){
      print('Error ===> ${e.toString()}');
    }
  }

  Future _getUser() async {
    GetUserDataUseCase useCase = GetUserDataUseCase(userRepository!);
    final user = await useCase.getUserData(() {
      Utils.showToast('something went wrong', 1);
    });
    if (user != null) {
      this.user = user;
    }
  }



}