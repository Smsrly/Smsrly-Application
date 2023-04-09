import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/ui/widgets/text_fields/rounded_text_field.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/reset_password_viewmodel.dart';
import '../../../res/dimen.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});


  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<ResetPasswordViewModel>(context, listen: false);
    return SingleChildScrollView(
      child: Container(
        height: 300.h,
        padding: Dimensions.showModalSheetPadding,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringManager.forgotPass,
                style: AppStyles.showModalTextStyle2),
            25.h.he,
            Text(StringManager.forgotPassMessage, style: AppStyles.bodyText1),
            25.h.he,
            RoundedTextField(
              label: StringManager.email,
              inputType: TextInputType.emailAddress,
              fontSize: 18.sp,
              cursorColor: primaryColor,
              controller: viewModel.email,
            ),
            20.he,
            Center(
              child: SizedBox(
                width: double.infinity,
                child: Consumer<ResetPasswordViewModel>(
                    builder: (context, resetPasswordViewModel, child) {
                  return RoundedButton(
                      text: StringManager.next,
                      visible: !resetPasswordViewModel.isLoading,
                      onClick: () {
                        resetPasswordViewModel.next();
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
