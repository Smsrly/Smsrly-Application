import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/dimen.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/ui/widgets/text_fields/text_field_with_bottom_border.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';
import 'package:smsrly/viewmodel/login_view_model.dart';

import '../../utils/routes/route_name.dart';


class LoginScreen extends StatelessWidget {


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  LoginScreen({Key? key}) : super(key: key);


  Widget passwordField(){
    return
       Consumer<LoginViewModel>(
           builder: (context, loginViewModel, child){
             return TextFormField(
               cursorColor: textFieldCursorColor,
               obscureText: !loginViewModel.isPasswordVisible,
               controller: _passwordController,
               keyboardType: TextInputType.visiblePassword,
               decoration: InputDecoration(
                 labelText: StringManager.password,
                 suffixIcon: IconButton(
                     onPressed: () => loginViewModel.togglePassword()
                     ,
                     icon: Icon(!loginViewModel.isPasswordVisible
                         ? Icons.visibility_off
                         : Icons.visibility)),
                 labelStyle: TextStyle(
                     fontSize: 18.sp,
                     color: textFieldCursorColor
                 ),
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
       );
  }

  Widget navigateToSignUp(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(StringManager.haveAnAccountMessage,
            style: AppStyles.bodyText2),
        TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, RouteName.signUpRoute),
            child: Text(StringManager.signUp,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: StringManager.ibmPlexSans,
                  fontWeight: FontWeight.w400,
                )))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: Dimensions.contentSymmetricPadding,
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
                      style: AppStyles.headline1,
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                ),
                20.h.he,
                TextFieldWithBottomBorder(
                    controller: _emailController,
                    label: StringManager.email,
                    inputType: TextInputType.emailAddress,
                    fontSize: 18.sp),
                15.h.he,
                passwordField(),
                28.h.he,
                SizedBox(
                  width: double.infinity,
                  child: Consumer<LoginViewModel>(
                    builder: (context,authViewModel,child){
                      return RoundedButton(
                        onClick: () {
                          authViewModel.loginUser(_emailController.text, _passwordController.text, (){
                            Provider.of<AppViewModel>(context,listen: false).currUser = authViewModel.user;
                            Navigator.pushReplacementNamed(context, RouteName.screensContainerRoute);
                          });
                        },
                        text: StringManager.login,
                        visible: !authViewModel.isLoading,
                      );
                    },
                  ),
                ),
                4.h.he,
                navigateToSignUp(context),
                15.h.he,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
