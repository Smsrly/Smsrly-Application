import 'package:flutter/material.dart';
import 'package:smsrly/models/location.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/ui/home_screen/home.dart';
import 'package:smsrly/ui/navbar/bottom_nav_bar.dart';

import '../models/realestate.dart';

void main() {
  runApp(App(
      currUser: User(
          "123",
          "Ahmed Ebeid",
          "ebeidahmed2@gmail.com",
          "01153180577",
          Location(30.12571871868943, 31.70773392993082),
          "https://user-images.githubusercontent.com/90563044/207663077-79de358a-66ab-40fb-ba51-c16708a69474.jpg")));
}

class App extends StatefulWidget {
  late User currUser;
  List<RealEstate> realEstates = [];



  App({Key? key, required this.currUser}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Widget> screens = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container()
  ];

  @override
  void initState() {
    var screen1 = screens[0] as HomeScreen ;
    screen1.user=widget.currUser;
    screen1.realEstates = widget.realEstates;
    screen1.seeAllAction=(){
      setState(() {
        currPage=1;
      });
    };
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
