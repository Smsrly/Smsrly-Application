import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/utils/routes/route_name.dart';
import 'package:smsrly/viewmodel/reset_password_viewmodel.dart';
import '../../../res/colors.dart';
import '../../../res/dimen.dart';

import '../../widgets/buttons/rounded_normal_button.dart';
import '../../widgets/text_fields/rounded_text_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
    Provider.of<ResetPasswordViewModel>(context, listen: false);
    viewModel.initPass();
    return SingleChildScrollView(
      child: Container(
        padding: Dimensions.showModalSheetPadding,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringManager.resetPass, style: AppStyles.showModalTextStyle2),
            15.h.he,
            Text(StringManager.resetPassMessage, style: AppStyles.bodyText1),
            25.h.he,
            Consumer<ResetPasswordViewModel>(
                builder: (context, resetViewModel, child) {
                  return RoundedTextField(
                    label: StringManager.password,
                    controller: resetViewModel.passController,
                    onChange: (value) {},
                    obscureText: !resetViewModel.isPasswordVisible,
                    suffixIcon: resetViewModel.isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    onClickSuffixIcon: () {
                      resetViewModel.togglePassword();
                    },
                    inputType: TextInputType.emailAddress,
                    fontSize: 14.sp,
                    cursorColor: primaryColor,
                  );
                }),
            25.h.he,
            Consumer<ResetPasswordViewModel>(
                builder: (context, resetViewModel, child) {
                  return RoundedTextField(
                    label: StringManager.cPassword,
                    onClickSuffixIcon: () {
                      resetViewModel.toggleConfirmPass();
                    },
                    inputType: TextInputType.emailAddress,
                    obscureText: !viewModel.isConfirmPasswordVisible,
                    suffixIcon: resetViewModel.isConfirmPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    controller: viewModel.confirmPassController,
                    fontSize: 14.sp,
                    cursorColor: primaryColor,
                  );
                }),
            25.h.he,
            Center(
              child: SizedBox(
                width: double.infinity,
                child: Consumer<ResetPasswordViewModel>(
                    builder: (context, resetViewModel, child) {
                      return RoundedButton(
                          visible: !resetViewModel.isLoading,
                          text: StringManager.confirm, onClick: () {
                        viewModel.next(
                            onFinish: (){
                              resetViewModel.dispose();
                              Navigator.of(context).pushReplacementNamed(RouteName.screensContainerRoute);
                            }
                        );
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
