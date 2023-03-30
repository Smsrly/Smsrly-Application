import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/utils/routes/route_name.dart';
import 'package:smsrly/utils/routes/routes.dart';



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
          initialRoute: RouteName.onBoardingRoute,
          routes: routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
