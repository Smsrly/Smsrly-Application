import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/models/realestate.dart';
import 'package:smsrly/ui/authentication_screens/login.dart';
import 'package:smsrly/ui/authentication_screens/on_boarding.dart';
import 'package:smsrly/ui/authentication_screens/sign_up.dart';
import 'package:smsrly/ui/authentication_screens/splash_screen.dart';
import 'package:smsrly/ui/screens_container.dart';
import 'package:smsrly/ui/show_details/show_detail.dart';

void main(){
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
        return MaterialApp(
          initialRoute: OnBoarding.route,
          routes: {
            OnBoarding.route : (context)=> const OnBoarding(),
            Login.route : (context)=>  const Login(),
            SignUp.route : (context)=> const SignUp(),
            SplashScreen.route : (context)=> SplashScreen(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
