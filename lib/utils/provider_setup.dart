import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:smsrly/viewmodel/home_viewmodel.dart';
import 'package:smsrly/viewmodel/reset_password_viewmodel.dart';
import 'package:smsrly/viewmodel/splash_view_model.dart';
import 'package:smsrly/viewmodel/tab_viewmodel.dart';

import 'package:smsrly/viewmodel/app_view_model.dart';
import 'package:smsrly/viewmodel/login_view_model.dart';
import 'package:smsrly/viewmodel/sign_up_view_model.dart';
import 'package:smsrly/viewmodel/verification_view_model.dart';

import '../domain/repository/realestate_repository.dart';
import '../domain/repository/user_repository.dart';

class ProviderSetup{
  RealEstateRepository realEstateRepository;
  UserRepository userRepository;

  ProviderSetup(this.userRepository,this.realEstateRepository);

  List<SingleChildWidget> get providers{
    return [

      ChangeNotifierProvider(
        create: (BuildContext context) => AppViewModel(userRepository),
      ),

      ChangeNotifierProvider(create: (BuildContext context) => LoginViewModel(userRepository)),

      ChangeNotifierProvider(create: (BuildContext context) => SignUpViewModel(userRepository)),

      ChangeNotifierProvider(
          create: (BuildContext context) => VerificationViewModel(userRepository)),

      ChangeNotifierProvider(
          create: (BuildContext context) => ResetPasswordViewModel(userRepository)
      ),
      ChangeNotifierProvider(
          create: (BuildContext context) => SplashViewModel(realEstateRepository,userRepository)
      ),

      ChangeNotifierProvider(
          create: (BuildContext context) => TabViewModel()
      ),
      ChangeNotifierProvider(
          create: (BuildContext context) => HomeViewModel(realEstateRepository)
      )

    ];
  }

}
