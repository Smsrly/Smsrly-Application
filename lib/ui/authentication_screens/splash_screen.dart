import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smsrly/ui/screens_container.dart';
import '../../models/realestate.dart';
import '../../models/user.dart';

class SplashScreen extends StatefulWidget {

  static const  String route = "/SPLASH_SCREEN";

  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  User? currUser;

  List<RealEstate> realEstateItems=[];


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
  }

  void navigateToHome(var context)async{
    if(!_controller.isAnimating &&  realEstateItems.isNotEmpty ){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
        return ScreensContainer(
            currUser: User(
                "1",
                "Totti",
                "totti1234@gmail.com",
                "+201153180577",
                30.12571871868943,
                31.70773392993082,
                "https://www.thefamouspeople.com/profiles/images/francesco-totti-1.jpg"), items: realEstateItems
        );
      }));
    }

    }

  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration: const Duration(seconds: 5));
    getData();
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        navigateToHome(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Lottie.asset(
            "assets/animations/loading_home_animation.json",
            animate: true,
            repeat: false,
            controller: _controller,
            onLoaded: (comp) async {
              _controller.forward();
            }
        ) ,
      ),
    );
  }
}
