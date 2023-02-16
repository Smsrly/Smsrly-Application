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
  IconBottomBar _getBottomBarIcon(int index , String lightIconPath, String darkIconPath){
    return IconBottomBar(
          lightIcon: SizedBox(
              width: 27,
              height: 27,
              child: Image.asset(lightIconPath)),
          darkIcon: SizedBox(
              width: 27,
              height: 27,
              child: Image.asset(darkIconPath)),
          isSelected: currPage == index,
          onPressed: () {
            if (currPage != index) {
              setState(() {
                currPage = index;
              });
            }
          }
        );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[currPage],
        bottomNavigationBar: BottomNavBar(
         icons: [
          _getBottomBarIcon(0, "assets/images/home_icon_not_selected.png", "assets/images/home_icon_selected.png"),
          _getBottomBarIcon(1, "assets/images/search_not_selected_icon.png", "assets/images/search_selected_icon.png"),
          _getBottomBarIcon(2, "assets/images/add_icon_not_selected.png", "assets/images/add_selected_icon.png"),
          _getBottomBarIcon(3, "assets/images/save_icon_not_selected.png", "assets/images/save_icon_selected.png"),
          _getBottomBarIcon(4, "assets/images/setting_icon_not_selected.png", "assets/images/setting_icon_selected.png"),
        ]),
      ),
    );
  }
}
