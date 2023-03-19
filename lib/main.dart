import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smsrly/ui/authentication_screens/login.dart';
import 'package:smsrly/ui/authentication_screens/on_boarding.dart';
import 'package:smsrly/ui/authentication_screens/sign_up.dart';
import 'package:smsrly/ui/authentication_screens/splash_screen.dart';
import 'package:smsrly/ui/screens_container.dart';

import 'helper/bindings.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          initialBinding: Binding(),
          home: const OnBoarding(),
          getPages: [
            GetPage(name: OnBoarding.route, page: () => const OnBoarding()),
            GetPage(name: Login.route, page: () => Login()),
            GetPage(name: SignUp.route, page: () => const SignUp()),
            GetPage(name: SplashScreen.route, page: () =>  SplashScreen()),
            GetPage(name: ScreensContainer.route, page: () =>  ScreensContainer()),

          ],

          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
