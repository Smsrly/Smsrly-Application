import 'dart:math';

import 'package:flutter/material.dart';

import 'package:smsrly/models/user.dart';
import 'package:smsrly/ui/adds_screens/myadds.dart';
import 'package:smsrly/ui/home_screen/home.dart';
import 'package:smsrly/ui/sell_screen/sell.dart';
import 'package:smsrly/ui/setting_screens/setting.dart';
import 'package:smsrly/ui/widgets/navbar/bottom_nav_bar.dart';
import 'package:smsrly/ui/widgets/navbar/bottombar_icon.dart';

import '../models/realestate.dart';
import 'explore_screen/explore.dart';

class ScreensContainer extends StatefulWidget {
  static const String route = "/SCREENS_CONTAINER";
  late User currUser;
  late List<RealEstate> items;

  ScreensContainer({Key? key,required this.currUser,required this.items})
      : super(key: key);

  @override
  State<ScreensContainer> createState() => _ScreensContainerState();
}

class _ScreensContainerState extends State<ScreensContainer> {
  int currPage = 0;

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

    var screen2 = screens[1] as ExploreScreen;
    screen2.items = widget.items;
    screen2.user = widget.currUser;
    super.initState();
  }

  IconBottomBar _getBottomBarIcon(
      int index, String lightIconPath, String darkIconPath) {
    return IconBottomBar(
        lightIcon:
            SizedBox(width: 27, height: 27, child: Image.asset(lightIconPath)),
        darkIcon:
            SizedBox(width: 27, height: 27, child: Image.asset(darkIconPath)),
        isSelected: currPage == index,
        onPressed: () {
          if (currPage != index) {
            setState(() {
              currPage = index;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[currPage],
        bottomNavigationBar: BottomNavBar(icons: [
          _getBottomBarIcon(0, "assets/images/home_icon_not_selected.png",
              "assets/images/home_icon_selected.png"),
          _getBottomBarIcon(1, "assets/images/search_not_selected_icon.png",
              "assets/images/search_selected_icon.png"),
          _getBottomBarIcon(2, "assets/images/add_icon_not_selected.png",
              "assets/images/add_selected_icon.png"),
          _getBottomBarIcon(3, "assets/images/save_icon_not_selected.png",
              "assets/images/save_icon_selected.png"),
          _getBottomBarIcon(4, "assets/images/setting_icon_not_selected.png",
              "assets/images/setting_icon_selected.png"),
        ]),
      ),
    );
  }
}
