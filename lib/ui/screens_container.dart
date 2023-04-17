import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smsrly/ui/adds_screens/myadds.dart';
import 'package:smsrly/ui/home_screen/home.dart';
import 'package:smsrly/ui/sell_screen/sell.dart';
import 'package:smsrly/ui/setting_screens/setting.dart';
import 'package:smsrly/ui/widgets/navbar/bottom_nav_bar.dart';
import 'package:smsrly/ui/widgets/navbar/bottombar_icon.dart';
import 'package:smsrly/viewmodel/tab_viewmodel.dart';

import '../res/strings.dart';
import 'explore_screen/explore.dart';

class ScreensContainer extends StatelessWidget {
  const ScreensContainer({Key? key}) : super(key: key);

  Widget _getBottomBarIcon(
      int index,
      String lightIconPath,
      String darkIconPath,
      ) {
    return Consumer<TabViewModel>(
        builder: (_,viewModel,__){
          return IconBottomBar(
              lightIcon: SizedBox(
                  width: index != 0 ? 27 : 32,
                  height: index != 0 ? 27 : 32,
                  child: Image.asset(lightIconPath)),
              darkIcon: SizedBox(
                  width: index != 0 ? 27 : 32,
                  height: index != 0 ? 27 : 32,
                  child: Image.asset(darkIconPath)),
              isSelected: viewModel.currentIndex == index,
              onPressed: () {
                viewModel.updateCurrentIndex(index);
              });
        }
    );
  }

  Widget? getCurrentScreenByIndex(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ExploreScreen();
      case 2:
        return const SellScreen();
      case 3:
        return const MyAdds();
      case 4:
        return Setting();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TabViewModel>(
        builder: (_,viewModel,__){
          return getCurrentScreenByIndex(viewModel.currentIndex)!;
        },
      ),
      bottomNavigationBar: BottomNavBar(icons: [
        _getBottomBarIcon(
            0,
            StringManager.homeIconNotSelected,
            StringManager.homeIconSelected,
        ),
        _getBottomBarIcon(
            1,
            StringManager.searchIconNotSelected,
            StringManager.searchIconSelected,
        ),
        _getBottomBarIcon(
            2,
            StringManager.addIconNotSelected,
            StringManager.addIconSelected,
        ),
        _getBottomBarIcon(
            3,
            StringManager.saveIconNotSelected,
            StringManager.saveIconSelected,
        ),
        _getBottomBarIcon(
            4,
            StringManager.settingIconNotSelected,
            StringManager.settingIconSelected,
        ),
      ]),
    );
  }
}
