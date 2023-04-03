import 'package:flutter/material.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import '../../../res/dimen.dart';

import '../../widgets/buttons/rounded_normal_button.dart';
import '../../widgets/text_fields/rounded_text_field.dart';
import 'package:smsrly/res/styles.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});




  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding:Dimensions.showModalSheetPadding,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Reset Password",   style: AppStyles.showModalTextStyle,),
          25.he,
          const Text("Set the new password for your account so"),
          const Text("you can login and acces all the features."),
          25.he,
          const Text("Password"),
          10.he,
          RoundedTextField(
            cursorColor: Colors.black,
            inputType: TextInputType.visiblePassword,
          ),
          25.he,
          const Text("Confirm Password"),
          10.he,
          RoundedTextField(
            cursorColor: Colors.white,
            inputType: TextInputType.visiblePassword,

          ),
          25.he,
          Center(
            child: SizedBox(
              width: double.infinity,
              child: RoundedButton(text: "Reset Password", onClick: (){
                
              }),
            ),
          )
        ],
      ),
    );
  }
}
