import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/dimen.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/utils/helpers/extensions.dart';

import '../../res/strings.dart';
import '../../utils/routes/route_name.dart';
import '../../viewmodel/app_view_model.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  Widget imageBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(StringManager.onBoardingScreenBackgroundImage),
            fit: BoxFit.cover),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appViewModel = Provider.of<AppViewModel>(context,listen: false);
    return Scaffold(
        body: Stack(
      children: [
        imageBackground(),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: blackWithMediumOpacity,
        ),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              SizedBox(
                  width: 400.w,
                  height: 400.h,
                  child: Image.asset(StringManager.onBoardingScreenLogo)),
              const Expanded(flex: 1, child: SizedBox()),
              Container(
                padding: Dimensions.contentSymmetricPadding,
                width: double.infinity,
                child: RoundedButton(
                  onClick: () {
                    appViewModel.setSeenOnBoarding();
                    context.pushReplacementNamed(RouteName.loginRoute);
                  },
                  text: StringManager.getStarted,
                ),
              ),
              15.h.he
            ],
          ),
        )
      ],
    ));
  }
}
