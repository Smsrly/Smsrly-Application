import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/ui/widgets/text_fields/text_field_with_bottom_border.dart';

import '../../utils/routes/route_name.dart';


class LoginScreen extends StatelessWidget {


  const LoginScreen({Key? key}) : super(key: key);


  Widget passwordField(){
    return
       TextFormField(
        cursorColor: textFieldCursorColor,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: StringManager.password,
          suffixIcon: IconButton(
              onPressed: () {
              },
              icon: Icon(true
                  ? Icons.visibility_off
                  : Icons.visibility)),
          labelStyle: TextStyle(
              fontSize: 18.sp,
              color: textFieldCursorColor),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
              width: 2,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: textFieldEnabledBorderColor,
              width: 1.5,
            ),
          ),
        ),
      );
  }

  Widget navigateToSignUp(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(StringManager.haveAnAccountMessage,
            style: getIBMPlexSansFont(18.sp, FontWeight.w400)),
        TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, RouteName.signUpRoute),
            child: Text(StringManager.signUp,
                style: getIBMPlexSansFont(18.sp, FontWeight.w400)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 350.h,
                  child: Image.asset(StringManager.pictureForLogin),
                ),
                Row(
                  children: [
                    Text(
                      StringManager.login,
                      style: getIBMPlexSansFont(32.sp, FontWeight.bold),
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFieldWithBottomBorder(
                    label: StringManager.email,
                    inputType: TextInputType.emailAddress,
                    fontSize: 18.sp),
                SizedBox(
                  height: 15.h,
                ),
                passwordField(),
                SizedBox(
                  height: 28.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RoundedButton(
                    onClick: () => Navigator.pushReplacementNamed(context, RouteName.screensContainerRoute),
                    text: StringManager.login,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                navigateToSignUp(context),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
