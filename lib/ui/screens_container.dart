
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smsrly/controller/controller.dart';
import 'package:smsrly/ui/widgets/navbar/bottom_nav_bar.dart';
import 'package:smsrly/ui/widgets/navbar/bottombar_icon.dart';

class ScreensContainer extends GetWidget<Controller> {
  static const String route = "/SCREENS_CONTAINER";

  const ScreensContainer({Key? key})
      : super(key: key);

  // int currPage = 0;

  // List<Widget> screens = [
  //   HomeScreen(),
  //   ExploreScreen(),
  //   Sell(),
  //   MyAdds(),
  //   Setting()
  // ];

  IconBottomBar _getBottomBarIcon(
      int index, String lightIconPath, String darkIconPath) {
    return IconBottomBar(
        lightIcon:
            SizedBox(width: 27, height: 27, child: Image.asset(lightIconPath)),
        darkIcon:
            SizedBox(width: 27, height: 27, child: Image.asset(darkIconPath)),
        isSelected: controller.navigatorValue == index,
        onPressed: () {
          if (controller.navigatorValue != index) {
            controller.changeSelectedValue(index);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
            () =>
                Scaffold(
                  body: controller.currentScreen.value,
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

                )
    );
  }
}
