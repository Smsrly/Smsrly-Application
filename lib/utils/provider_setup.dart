import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:smsrly/viewmodel/reset_password_viewmodel.dart';
import 'package:smsrly/viewmodel/splash_view_model.dart';
import 'package:smsrly/viewmodel/tab_viewmodel.dart';

import 'package:smsrly/viewmodel/app_view_model.dart';
import 'package:smsrly/viewmodel/login_view_model.dart';
import 'package:smsrly/viewmodel/sign_up_view_model.dart';
import 'package:smsrly/viewmodel/verification_view_model.dart';

List<SingleChildWidget> providers = [

  ChangeNotifierProvider(
    create: (BuildContext context) => AppViewModel(),
  ),

  ChangeNotifierProvider(create: (BuildContext context) => LoginViewModel()),

  ChangeNotifierProvider(create: (BuildContext context) => SignUpViewModel()),

  ChangeNotifierProvider(
      create: (BuildContext context) => VerificationViewModel()),

  ChangeNotifierProvider(
      create: (BuildContext context) => ResetPasswordViewModel()
  ),
  ChangeNotifierProvider(
      create: (BuildContext context) => SplashViewModel()
  ),

  ChangeNotifierProvider(
      create: (BuildContext context) => TabViewModel()
  )

];
