import 'dart:async';

import 'package:flutter/material.dart';

import 'package:smsrly/ui/adds_screens/myadds.dart';
import 'package:smsrly/ui/authentication_screens/splash_screen.dart';
import 'package:smsrly/ui/home_screen/home.dart';
import 'package:smsrly/ui/sell_screen/sell.dart';
import 'package:smsrly/ui/setting_screens/setting.dart';
import 'package:smsrly/ui/widgets/navbar/bottom_nav_bar.dart';
import 'package:smsrly/ui/widgets/navbar/bottombar_icon.dart';

import '../res/strings.dart';
import 'explore_screen/explore.dart';

class ScreensContainer extends StatefulWidget {
  const ScreensContainer({Key? key}) : super(key: key);

  @override
  State<ScreensContainer> createState() => _ScreensContainerState();
}

class _ScreensContainerState extends State<ScreensContainer> {
  var isSplashVisible = true;
  int currPage = 0;

  Widget? getCurrentScreenByIndex(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return ExploreScreen();
      case 2:
        return const SellScreen();
      case 3:
        return MyAdds();
      case 4:
        return Setting();
      default:
        return null;
    }
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      setState(() {
        isSplashVisible = false;
      });
    });

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
    return Scaffold(
      body:
          isSplashVisible ?
          const SplashScreen() :
          getCurrentScreenByIndex(currPage)!,
      bottomNavigationBar: isSplashVisible
          ? null
          : BottomNavBar(icons: [
              _getBottomBarIcon(
                  0,
                  StringManager.homeIconNotSelected,
                  StringManager.homeIconSelected
              ),
              _getBottomBarIcon(
                  1,
                  StringManager.searchIconNotSelected,
                  StringManager.searchIconSelected
              ),
              _getBottomBarIcon(
                  2,
                  StringManager.addIconNotSelected,
                  StringManager.addIconSelected
              ),
              _getBottomBarIcon(
                  3,
                  StringManager.saveIconNotSelected,
                  StringManager.saveIconSelected
              ),
              _getBottomBarIcon(
                  4,
                  StringManager.settingIconNotSelected,
                  StringManager.settingIconSelected
              ),
            ]),
    );
  }
}
