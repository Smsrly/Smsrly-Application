import 'dart:math';

import 'package:flutter/material.dart';

import 'package:smsrly/models/location.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/ui/adds_screens/myadds.dart';
import 'package:smsrly/ui/home_screen/home.dart';
import 'package:smsrly/ui/sell_screen/sell.dart';
import 'package:smsrly/ui/setting_screens/setting.dart';
import 'package:smsrly/ui/widgets/navbar/bottom_nav_bar.dart';
import 'package:smsrly/ui/widgets/navbar/bottombar_icon.dart';

import '../models/realestate.dart';
import 'explore_screen/explore.dart';


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
    Sell(),
    MyAdds(),
    Setting()
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
        bottomNavigationBar: BottomNavBar(
         icons: [
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
