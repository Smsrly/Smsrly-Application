import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import '../../../res/colors.dart';
import '../../../res/dimen.dart';

import '../../widgets/buttons/rounded_normal_button.dart';
import '../../widgets/text_fields/rounded_text_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:Dimensions.showModalSheetPadding,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringManager.resetPass,style: AppStyles.showModalTextStyle2),
            15.h.he,
            Text(StringManager.resetPassMessage,style: AppStyles.bodyText1),
            25.h.he,
            RoundedTextField(
              label: StringManager.password,
              onChange: (value){
              },

              inputType: TextInputType.emailAddress,
              fontSize: 14.sp,
              cursorColor: primaryColor,
            ),
            25.h.he,
            RoundedTextField(
              label: StringManager.cPassword,
              inputType: TextInputType.emailAddress,
              fontSize: 14.sp,
              cursorColor: primaryColor,
            ),
            25.h.he,
            Center(
              child: SizedBox(
                width: double.infinity,
                child: RoundedButton(text: StringManager.confirm, onClick: (){

                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}