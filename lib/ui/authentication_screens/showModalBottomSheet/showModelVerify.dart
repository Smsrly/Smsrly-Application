import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smsrly/ui/authentication_screens/showModalBottomSheet/resetPassword.dart';
import 'package:smsrly/utils/helpers/extensions.dart';

import '../../../res/dimen.dart';
import '../../../res/styles.dart';
import '../../widgets/buttons/rounded_normal_button.dart';


class ShowVerify extends StatelessWidget {
  const ShowVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:Dimensions.showModalSheetPadding,
        width: double.infinity,
        height: 400,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter 4 Digits Code",style:    AppStyles.showModalTextStyle2,),
            30.he,
            const Text("Enter the 4 digits code thats you recived on your email"),
            30.he,
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 68,
                  width: 64,
                  child:
                  TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    onChanged: (value){
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child:
                  TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    onChanged: (value){
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },

                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child:
                  TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    onChanged: (value){
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },

                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child:
                  TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    onChanged: (value){
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },

                  ),
                ),
              ],
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
                     const ResetPassword());
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
