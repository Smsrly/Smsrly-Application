import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/services/UserAccountService.dart';
import 'package:smsrly/ui/screens_container.dart';

import '../models/realestate.dart';


class Controller extends GetxController {

  Rx<User?> _user = Rx<User?>(null);
  List<RealEstate> realEstateItems=[];

  UserAccountService _userAccountService = new UserAccountService();

  User? get user => _user.value;

  set user(User? value) {
    _user.value = value;
  }

  var isLoginPasswordHidden = true.obs;


  var _navigatorValue = 0;
  get navigatorValue => _navigatorValue;

  var currentScreen = Scaffold(
    body: Center(
      child: Text("1"),
    ),
  ).obs;
  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch(selectedValue){
      case 0:{
        currentScreen.value = Scaffold(
          body: Center(
            child: Text("1"),
          ),
        );
        break;
      }
      case 1:{
        currentScreen.value = Scaffold(
          body: Center(
            child: Text("2"),
          ),
        );
        break;
      }
      case 2:{
        currentScreen.value = Scaffold(
          body: Center(
            child: Text("3"),
          ),
        );
        break;
      }
      case 3:{
        currentScreen.value = Scaffold(
          body: Center(
            child: Text("4"),
          ),
        );
        break;
      }
      case 4:{
        currentScreen.value = Scaffold(
          body: Center(
            child: Text("5"),
          ),
        );
        break;
      }
    }
  }


  @override
  void onInit() {
    super.onInit();
  }








  Future<dynamic> getData() async{
    var user1 = User(
        "1",
        "Leo Messi",
        "loemessi1234@gmail.com",
        "+201153180577",
        30.12571871868943,
        31.70773392993082,
        "https://phantom-marca.unidadeditorial.es/60192032bf2633d55bb044727463ec69/resize/660/f/webp/assets/multimedia/imagenes/2022/11/26/16694993827727.jpg"
    );
    var user2 = User(
        "1",
        "Totti",
        "totti1234@gmail.com",
        "+201153180577",
        30.12571871868943,
        31.70773392993082,
        "https://www.thefamouspeople.com/profiles/images/francesco-totti-1.jpg");
    var users = [user1, user2];

    RealEstate item1 = RealEstate(
        123,
        "https://www.travelandleisure.com/thmb/HaAgtnns6Cp6Tb08MJq8xXOHzH0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/soneva-jani-sunset-view-maldives-SONEVA0421-74b37591d80441ce87831a41da518e49.jpg",
        "Royal Sea Crown1",
        null,
        "123",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        1231,
        54,
        5,
        5,
        100000,
        21321.3,
        1231.2,
        "Egypt",
        "Alex",1);
    RealEstate item2 = RealEstate(
        122,
        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/lpibo-ew-1656015868.jpg",
        "Royal Sea Crown2",
        null,
        "123",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        1231,
        54,
        5,
        5,
        100000,
        21321.3,
        1231.2,
        "Egypt",
        "Cairo",0);
    RealEstate item3 = RealEstate(
        123,
        "https://pix8.agoda.net/hotelImages/2163054/-1/4f3b334212d6cf837f60ee731edf916d.jpg",
        "Royal Sea Crown3",
        null,
        "123",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        1231,
        54,
        5,
        5,
        100000,
        21321.3,
        1231.2,
        "Morocco",
        "Elrbat",1);
    var items = [item1, item2, item3];
    for (int i = 0; i < 10; i++) {
      var currUserIndex = Random().nextInt(users.length);
      var currItemIndex = Random().nextInt(3);
      var currItemID = Random().nextInt(100);
      var realCurrItem = items[currItemIndex];

      var currItem = RealEstate(currItemID,
          realCurrItem.imageUrl,
          realCurrItem.title,
          users[currUserIndex], users[currUserIndex].userId,
          realCurrItem.description,
          realCurrItem.area,
          realCurrItem.floor,
          realCurrItem.bathroomsNo,
          realCurrItem.roomsNo,
          realCurrItem.price,
          realCurrItem.longitude,
          realCurrItem.latitude,
          realCurrItem.country,
          realCurrItem.city,
          realCurrItem.rentOrSale
      );
      currItem.realEstateId=currItemID;
      realEstateItems.add(currItem);

    }
    print('finished');
    Get.to(ScreensContainer());
  }

}