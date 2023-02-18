import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/authentication_screens/sign_up.dart';
import 'package:smsrly/ui/authentication_screens/splash_screen.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/ui/widgets/colors.dart';
import 'package:smsrly/ui/widgets/text_fields/text_field_with_bottom_border.dart';

class Login extends StatefulWidget {
  static const  String route = "/LOGIN";

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _isNotVisible = true;


  Widget passwordField(){
    return TextFormField(
      cursorColor: textFieldCursorColor,
      obscureText: _isNotVisible,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isNotVisible = !_isNotVisible;
              });
            },
            icon: Icon(_isNotVisible
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


  Widget navigateToSignUp(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account ?",
            style: getIBMPlexSansFont(18.sp, FontWeight.w400)),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(SignUp.route);
            },
            child: Text('Sign Up',
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
                      "Login",
                      style: getIBMPlexSansFont(32.sp, FontWeight.bold),
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFieldWithBottomBorder(
                    label: 'Email',
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
                      Navigator.of(context).pushReplacementNamed(SplashScreen.route);
                    },
                    text: 'Login',
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                navigateToSignUp(),
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
