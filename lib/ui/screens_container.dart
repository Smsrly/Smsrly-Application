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
  ScreensContainer({Key? key}) : super(key: key);
  final _pageController = PageController(initialPage: 0);

  IconBottomBar _getBottomBarIcon(
      int index,
      String lightIconPath,
      String darkIconPath,
      bool Function(int) isSelected,
      Function(int) onClick) {
    return IconBottomBar(
        lightIcon: SizedBox(
            width: index != 0 ? 27 : 32,
            height: index != 0 ? 27 : 32,
            child: Image.asset(lightIconPath)),
        darkIcon: SizedBox(
            width: index != 0 ? 27 : 32,
            height: index != 0 ? 27 : 32,
            child: Image.asset(darkIconPath)),
        isSelected: isSelected(index),
        onPressed: () {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          onClick(index);
        });
  }

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
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TabViewModel>(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          viewModel.updateCurrentIndex(index);
        },
        children: [
          HomeScreen(),
          ExploreScreen(),
          const SellScreen(),
          MyAdds(),
          Setting()
        ],
      ),
      bottomNavigationBar: BottomNavBar(icons: [
        _getBottomBarIcon(
            0,
            StringManager.homeIconNotSelected,
            StringManager.homeIconSelected,
            (index) => viewModel.currentIndex == index, (index) {
              if (viewModel.currentIndex != index) {
                viewModel.updateCurrentIndex(index);
              }
            }
        ),
        _getBottomBarIcon(
            1,
            StringManager.searchIconNotSelected,
            StringManager.searchIconSelected,
            (index) => viewModel.currentIndex == index, (index) {
              if (viewModel.currentIndex != index) {
                viewModel.updateCurrentIndex(index);
              }
            }
        ),
        _getBottomBarIcon(
            2,
            StringManager.addIconNotSelected,
            StringManager.addIconSelected,
            (index) => viewModel.currentIndex == index, (index) {
              if (viewModel.currentIndex != index) {
                viewModel.updateCurrentIndex(index);
              }
            }
        ),
        _getBottomBarIcon(
            3,
            StringManager.saveIconNotSelected,
            StringManager.saveIconSelected,
            (index) => viewModel.currentIndex == index, (index) {
              if (viewModel.currentIndex != index) {
                viewModel.updateCurrentIndex(index);
              }
            }
        ),
        _getBottomBarIcon(
            4,
            StringManager.settingIconNotSelected,
            StringManager.settingIconSelected,
            (index) => viewModel.currentIndex == index, (index) {
              if (viewModel.currentIndex != index) {
                viewModel.updateCurrentIndex(index);
              }
            }
        ),
      ]),
    );
  }
}
