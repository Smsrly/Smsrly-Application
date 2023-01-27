import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smsrly/models/location.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/ui/home_screen/home.dart';
import 'package:smsrly/ui/navbar/bottom_nav_bar.dart';

import '../models/realestate.dart';
import 'explore_screen/explore.dart';

void main() {
  var user1 = User(
      "1",
      "Ahmed Ebeid",
      "ebeidahmed2@gmail.com",
      "01153180577",
      Location(30.12571871868943, 31.70773392993082),
      "https://user-images.githubusercontent.com/90563044/207663077-79de358a-66ab-40fb-ba51-c16708a69474.jpg");
  var user2 = User(
      "2",
      "Youssef Amr",
      "youssefamr323@gmail.com",
      "01153180577",
      Location(30.12571871868943, 31.70773392993082),
      "https://user-images.githubusercontent.com/90563044/207663077-79de358a-66ab-40fb-ba51-c16708a69474.jpg");
  var user3 = User(
      "2",
      "Omar Osama",
      "omarosama323@gmail.com",
      "01153180577",
      Location(30.12571871868943, 31.70773392993082),
      "https://user-images.githubusercontent.com/90563044/207663077-79de358a-66ab-40fb-ba51-c16708a69474.jpg");
  var users = [user1, user2, user3];

  RealEstate item1 = RealEstate(
      123,
      "https://www.travelandleisure.com/thmb/HaAgtnns6Cp6Tb08MJq8xXOHzH0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/soneva-jani-sunset-view-maldives-SONEVA0421-74b37591d80441ce87831a41da518e49.jpg",
      "Royal Sea Crown",
      null,
      "123",
      "asdasd",
      1231,
      54,
      5,
      5,
      100000,
      Location(21321.3, 1231.2),
      "Egypt",
      "Alex");
  RealEstate item2 = RealEstate(
      122,
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/lpibo-ew-1656015868.jpg",
      "Royal Sea Crown",
      null,
      "123",
      "asdasd",
      1231,
      54,
      5,
      5,
      100000,
      Location(21321.3, 1231.2),
      "Egypt",
      "Alex");
  RealEstate item3 = RealEstate(
      123,
      "https://pix8.agoda.net/hotelImages/2163054/-1/4f3b334212d6cf837f60ee731edf916d.jpg",
      "Royal Sea Crown",
      null,
      "123",
      "asdasd",
      1231,
      54,
      5,
      5,
      100000,
      Location(21321.3, 1231.2),
      "Egypt",
      "Alex");
  var items = [item1, item2, item3];
  List<int> IDs=[];
  Map<int, RealEstate> itemsMap = {};
  for (int i = 0; i < 10; i++) {
    var currUserIndex = Random().nextInt(3);
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
        realCurrItem.location,
        realCurrItem.country,
      realCurrItem.city);
    print("old : ${currItem.realEstateId}");
    currItem.realEstateId=currItemID;
    print("new : ${currItem.realEstateId}");
    int mapSize=itemsMap.length;
    itemsMap[currItem.realEstateId] = currItem;
    if(mapSize != itemsMap.length){
      IDs.add(currItem.realEstateId);
    }
  }
  print(itemsMap);
  print(itemsMap.length);
  runApp(App(
      currUser: User(
          "123",
          "Ahmed Ebeid",
          "ebeidahmed2@gmail.com",
          "01153180577",
          Location(30.12571871868943, 31.70773392993082),
          "https://user-images.githubusercontent.com/90563044/207663077-79de358a-66ab-40fb-ba51-c16708a69474.jpg"),items: itemsMap,IDs: IDs,),);
}

class App extends StatefulWidget {
  late User currUser;
  late Map<int, RealEstate> items;
  late List<int> IDs;

  App({Key? key, required this.currUser,required this.items,required this.IDs}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
    Container(),
    Container(),
    Container()
  ];

  @override
  void initState() {
    var screen1 = screens[0] as HomeScreen;
    screen1.user = widget.currUser;
    screen1.items = widget.items;
    screen1.seeAllAction = () {
      setState(() {
        currPage = 1;
      });
    };
    screen1.IDs=widget.IDs;

    var screen2 = screens[1] as ExploreScreen;
    screen2.items=widget.items;
    screen2.IDs=widget.IDs;
    screen2.user=widget.currUser;
    super.initState();
  }

  int currPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[currPage],
        bottomNavigationBar: BottomNavBar(icons: [
          IconBottomBar(
              lightIcon: SizedBox(
                  width: 27,
                  height: 27,
                  child: Image.asset("images/home_icon_not_selected.png")),
              darkIcon: SizedBox(
                  width: 27,
                  height: 27,
                  child: Image.asset("images/home_icon_selected.png")),
              isSelected: currPage == 0,
              onPressed: () {
                if (currPage != 0) {
                  setState(() {
                    currPage = 0;
                  });
                }
              }),
          IconBottomBar(
              lightIcon: SizedBox(
                  width: 23,
                  height: 23,
                  child: Image.asset("images/search_not_selected_icon.png")),
              darkIcon: SizedBox(
                  width: 23,
                  height: 23,
                  child: Image.asset("images/search_selected_icon.png")),
              isSelected: currPage == 1,
              onPressed: () {
                if (currPage != 1) {
                  setState(() {
                    currPage = 1;
                  });
                }
              }),
          IconBottomBar(
              lightIcon: SizedBox(
                  width: 23,
                  height: 23,
                  child: Image.asset("images/add_icon_not_selected.png")),
              darkIcon: SizedBox(
                  width: 23,
                  height: 23,
                  child: Image.asset("images/add_selected_icon.png")),
              isSelected: currPage == 2,
              onPressed: () {
                if (currPage != 2) {
                  setState(() {
                    currPage = 2;
                  });
                }
              }),
          IconBottomBar(
              lightIcon: SizedBox(
                  width: 23,
                  height: 23,
                  child: Image.asset("images/save_icon_not_selected.png")),
              darkIcon: SizedBox(
                  width: 23,
                  height: 23,
                  child: Image.asset("images/save_icon_selected.png")),
              isSelected: currPage == 3,
              onPressed: () {
                if (currPage != 3) {
                  setState(() {
                    currPage = 3;
                  });
                }
              }),
          IconBottomBar(
              lightIcon: SizedBox(
                  width: 23,
                  height: 23,
                  child: Image.asset("images/setting_icon_not_selected.png")),
              darkIcon: SizedBox(
                  width: 23,
                  height: 23,
                  child: Image.asset("images/setting_icon_selected.png")),
              isSelected: currPage == 4,
              onPressed: () {
                if (currPage != 4) {
                  setState(() {
                    currPage = 4;
                  });
                }
              }),
        ]),
      ),
    );
  }
}
