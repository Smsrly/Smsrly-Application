import 'package:flutter/material.dart';
import 'package:smsrly/ui/authentication_screens/showModalBottomSheet/showModelVerify.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/ui/widgets/text_fields/rounded_text_field.dart';
import 'package:smsrly/utils/helpers/extensions.dart';

import '../../../res/colors.dart';
import '../../../res/dimen.dart';
import '../../../res/styles.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});



  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:Container(
        padding:Dimensions.showModalSheetPadding,
        width: double.infinity,
        height: 400,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Forgot Password",style:  AppStyles.showModalTextStyle2),
            35.he,
            const Text("Enter your email for the verification proccess,"),
            5.he,
            const Text("We will send 4 digits code to your email"),
            35.he,
            const Text("E-mail"),
            20.he,
             RoundedTextField(
               cursorColor: Colors.white,
               inputType: TextInputType.emailAddress,

             ),
              20.he,
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: RoundedButton(text: "Next", onClick: (){
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder( // <-- SEE HERE
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        isScrollControlled: true,
                        context: context, builder: (ctx)=>
                    const ShowVerify());
                  }),
                ),
              )
          ],
        ),
      ),
    );
  }
}
