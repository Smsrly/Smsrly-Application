import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:smsrly/utils/helpers/extensions.dart';

import '../../../res/dimen.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import '../../../viewmodel/reset_password_viewmodel.dart';
import '../../widgets/buttons/rounded_normal_button.dart';
import '../../widgets/text_fields/code_text_field.dart';

class VerifyResetPasswordCodeView extends StatelessWidget {
  const VerifyResetPasswordCodeView({super.key});


  Widget numField(BuildContext context, TextEditingController controller) {
    return Expanded(
      child: Container(
          margin: Dimensions.codeField,
          child: CodeTextField(
              parentContext: context,
              controller: controller)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<ResetPasswordViewModel>(context, listen: false);

    return SingleChildScrollView(
      child: Container(
        padding: Dimensions.showModalSheetPadding,
        width: double.infinity,
        height: 300.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringManager.enterCode, style: AppStyles.showModalTextStyle2),
            35.h.he,
            Text(StringManager.codeSendMessage, style: AppStyles.bodyText1),
            20.h.he,
            Row(
              children: [

                numField(context, viewModel.code[0]),

                numField(context, viewModel.code[1]),

                numField(context, viewModel.code[2]),

                Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: CodeTextField(
                          parentContext: context,
                          onChanged: (){
                            FocusScope.of(context).nextFocus();
                          },
                          controller: viewModel.code[3]
                      )
                  ),
                ),



              ],
            ),
            40.h.he,
            Row(
              children: [
                Expanded(
                  child: RoundedButton(
                      text: StringManager.back,
                      onClick: () {
                        viewModel.back();
                      }),
                ),

                10.w.wi,
                Expanded(
                  child: RoundedButton(
                      text: StringManager.next,
                      onClick: () {
                        viewModel.next();
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
