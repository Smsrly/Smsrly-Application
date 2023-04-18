import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/dimen.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/ui/widgets/buttons/google_button_login.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/ui/widgets/text_fields/text_field_with_bottom_border.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/login_view_model.dart';
import 'package:smsrly/viewmodel/reset_password_viewmodel.dart';

import '../../utils/routes/route_name.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  Widget passwordField() {
    return Consumer<LoginViewModel>(builder: (context, loginViewModel, child) {
      return TextFieldWithBottomBorder(
        label: StringManager.password,
        fontSize: 18.sp,
        obscureText: !loginViewModel.isPasswordVisible,
        controller: _passwordController,
        inputType: TextInputType.visiblePassword,
        suffixIcon: IconButton(
            onPressed: () => loginViewModel.togglePassword(),
            icon: Icon(!loginViewModel.isPasswordVisible
                ? Icons.visibility_off
                : Icons.visibility)),
      );
    });
  }

  Widget navigateToSignUp(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(StringManager.haveAnAccountMessage, style: AppStyles.bodyText2),
        TextButton(
            onPressed: () =>
                context.pushReplacementNamed(RouteName.signUpRoute),
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
                  height: 300.h,
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
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              isScrollControlled: true,
                              context: context,
                              builder: (ctx) => Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Consumer<ResetPasswordViewModel>(
                                      builder: (context, viewModel, child) {
                                    return AnimatedSwitcher(
                                        duration:
                                            const Duration(milliseconds: 350),
                                        child: viewModel.getCurrentWidget());
                                  })));
                        },
                        child: const Text(StringManager.forgotPass))
                  ],
                ),
                12.h.he,
                SizedBox(
                  width: double.infinity,
                  child: Consumer<LoginViewModel>(
                    builder: (context, authViewModel, child) {
                      return RoundedButton(
                        onClick: () {
                          authViewModel.loginUser(
                              _emailController.text, _passwordController.text,
                              () {
                            context.pushReplacementNamed(RouteName.splashRoute);
                          });
                        },
                        text: StringManager.login,
                        visible: !authViewModel.isLoading,
                      );
                    },
                  ),
                ),
                12.h.he,
                SizedBox(
                  width: double.infinity,
                  child: Consumer<LoginViewModel>(
                    builder: (context, authViewModel, child) {
                      return GoogleLoginButton(
                        onClick: () {
                          authViewModel.loginWithGoogle(() {
                            context.pushReplacementNamed(RouteName.splashRoute);
                          });
                        },
                        text: StringManager.loginWithGoogle,
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
