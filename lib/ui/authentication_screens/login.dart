import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smsrly/controller/controller.dart';
import 'package:smsrly/ui/authentication_screens/sign_up.dart';
import 'package:smsrly/ui/authentication_screens/splash_screen.dart';
import 'package:smsrly/ui/strings.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/ui/widgets/colors.dart';
import 'package:smsrly/ui/widgets/text_fields/text_field_with_bottom_border.dart';

import '../../models/user.dart';

class Login extends GetView<Controller> {
  static const  String route = "/LOGIN";


  Login({Key? key}) : super(key: key);


  Widget passwordField(){
    return Obx(
      ()=>
       TextFormField(
        cursorColor: textFieldCursorColor,
        obscureText: controller.isLoginPasswordHidden.value,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
              onPressed: () {
                controller.isLoginPasswordHidden.value = !controller.isLoginPasswordHidden.value;
              },
              icon: Icon(controller.isLoginPasswordHidden.value
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
      ),
    );
  }

  Widget navigateToSignUp(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(StringManeger.dont,
            style: getIBMPlexSansFont(18.sp, FontWeight.w400)),
        TextButton(
            onPressed: () {
              Get.to(const SignUp());
            },
            child: Text(StringManeger.signUp,
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
                  child: Image.asset("assets/images/picture_for_login.png"),
                ),
                Row(
                  children: [
                    Text(
                      StringManeger.login,
                      style: getIBMPlexSansFont(32.sp, FontWeight.bold),
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFieldWithBottomBorder(
                    label: StringManeger.email,
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
                    onClick: () {
                      controller.user = User(
                          "1",
                          "Totti",
                          "totti1234@gmail.com",
                          "+201153180577",
                          30.12571871868943,
                          31.70773392993082,
                          "https://www.thefamouspeople.com/profiles/images/francesco-totti-1.jpg"
                      );
                      Get.to(SplashScreen());
                    },
                    text: StringManeger.login,
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
