import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/authentication_screens/on_boarding.dart';

void main(){
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: OnBoarding(),
        );
      },
    );
  }
}
