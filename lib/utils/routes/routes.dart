import 'package:smsrly/ui/authentication_screens/login.dart';
import 'package:smsrly/ui/authentication_screens/on_boarding.dart';
import 'package:smsrly/ui/authentication_screens/sign_up.dart';
import 'package:smsrly/ui/authentication_screens/splash_screen.dart';
import 'package:smsrly/ui/screens_container.dart';
import 'package:smsrly/ui/setting_screens/contact_us.dart';
import 'package:smsrly/ui/setting_screens/edit_profile.dart';
import 'package:smsrly/ui/show_details/show_detail.dart';
import 'package:smsrly/utils/routes/route_name.dart';

final routes = {
  RouteName.onBoardingRoute : (context) =>  const OnBoarding(),
  RouteName.loginRoute : (context) =>  const LoginScreen(),
  RouteName.signUpRoute : (context) =>  const SignUpScreen(),
  RouteName.splashRoute : (context) =>  const SplashScreen(),
  RouteName.screensContainerRoute : (context) =>  const ScreensContainer(),
  RouteName.editProfileRoute : (context) =>  const EditProfileScreen(),
  RouteName.contactUsRoute : (context) =>  const ContactUsScreen(),
  RouteName.showDetailsRoute : (context) =>  ShowDetailsScreen()
};
