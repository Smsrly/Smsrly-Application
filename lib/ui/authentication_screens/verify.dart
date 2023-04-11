import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/dimen.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/verification_view_model.dart';

import '../../res/strings.dart';
import '../../utils/routes/route_name.dart';
import '../widgets/text_fields/code_text_field.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});

  final numbers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  Widget numField(BuildContext context, TextEditingController controller) {
    return Expanded(
      child: Container(
          margin: Dimensions.codeField,
          child: CodeTextField(
              parentContext: context,
              controller:controller
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          padding: Dimensions.contentSymmetricPadding,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              32.h.he,
              const Text(
                StringManager.verifyYourEmail,
                style: AppStyles.title1,
              ),
              const Expanded(flex: 3, child: SizedBox()),
              Image.asset(
                StringManager.verifyImage,
              ),
              const Expanded(flex: 3, child: SizedBox()),
              Row(
                children: [
                  numField(context, numbers[0]),
                  numField(context, numbers[1]),
                  numField(context, numbers[2]),
                  numField(context, numbers[3]),
                ],
              ),
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Container(
                margin: Dimensions.bottomMargin,
                width: double.infinity,
                child: Consumer<VerificationViewModel>(
                    builder: (context, viewModel, child) {
                      return RoundedButton(
                          visible: !viewModel.isLoading,
                          text: StringManager.submit,
                          onClick: () {
                            String code = "";
                            for (var element in numbers) {
                              code += element.text;
                            }
                            viewModel.checkVerificationCode(code, () {
                              Navigator.pushReplacementNamed(
                                  context, RouteName.splashRoute);
                            });
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
