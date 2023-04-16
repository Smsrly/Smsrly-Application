import 'package:flutter/cupertino.dart';
import 'package:smsrly/models/realestate.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/utils/utils.dart';

import '../domain/repository/realestate_repository.dart';
import '../domain/repository/user_repository.dart';
import '../domain/use_cases/user_use_cases/get_user_data/get_user_data_use_case.dart';

class SplashViewModel with ChangeNotifier{
  RealEstateRepository realEstateRepository;
  UserRepository userRepository;
  late GetUserDataUseCase useCase;


  SplashViewModel(this.realEstateRepository,this.userRepository){
    useCase = GetUserDataUseCase(userRepository);
  }

  User? user;
  List<RealEstate>? realEstateItems;

  // Future<bool> onStart() async {
  //   await getData();
  //   return user != null && realEstateItems != null;
  // }
  //
  Future getData() async {
    await _getUser();
    await _getItems();
  }

  Future _getItems() async {
    print('hhhadsa');
    final items = await realEstateRepository.getRealEstates();
    print('items ==> $items');
    if(items is List<RealEstate>){
      realEstateItems = items;
      print(items);
    }
  }

  Future _getUser() async {
    final user = await useCase.getUserData(() {
      Utils.showToast(StringManager.wentWrong, 1);
    });
    if (user != null) {
      print(user.firstName);
      this.user = user;
    }
  }



}