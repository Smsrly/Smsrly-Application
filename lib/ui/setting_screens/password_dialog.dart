import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/setting_viewmodel.dart';

import '../../res/colors.dart';
import '../widgets/text_fields/rounded_text_field.dart';

class PasswordDialog extends StatelessWidget {
  final TextEditingController _controller1 =TextEditingController();
  final TextEditingController _controller2 =TextEditingController();
  PasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300.w,
        height: 340.h,
        child: Column(children: [
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
                alignment: AlignmentDirectional.topEnd,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close)),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(StringManager.privacy, style: AppStyles.bodyText2),
          ),
          15.he,
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(StringManager.newPass,
                  style: TextStyle(fontSize: 16.sp, color: Colors.black)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: SizedBox(
                height: 50.h,
                child: Consumer<SettingViewModel>(
                    builder: (context, viewModel, child) {
                  return RoundedTextField(
                    controller: _controller1,
                    onChange: (value) {},
                    obscureText: !viewModel.isNewPasswordVisible,
                    suffixIcon: !viewModel.isNewPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    onClickSuffixIcon: () {
                      viewModel.toggleNewPassword();
                    },
                    fontSize: 14.sp,
                    cursorColor: primaryColor,
                  );
                }),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(StringManager.cPassword,
                  style: TextStyle(fontSize: 16.sp, color: Colors.black)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: SizedBox(
                height: 50.h,
                child: Consumer<SettingViewModel>(
                    builder: (context, viewModel, child) {
                  return RoundedTextField(
                    controller: _controller2,
                    onChange: (value) {},
                    obscureText: !viewModel.isConfirmPasswordVisible,
                    suffixIcon: !viewModel.isConfirmPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    onClickSuffixIcon: () {
                      viewModel.toggleConfirmPassword();
                    },
                    fontSize: 14.sp,
                    cursorColor: primaryColor,
                  );
                }),
              )),
          Padding(
            padding: const EdgeInsets.all(14),
            child: SizedBox(
              width: double.infinity,
              child: Consumer<SettingViewModel>(
                  builder: (context, viewModel, child) {
                return RoundedButton(
                    visible: !viewModel.isLoading,
                    text: StringManager.submit,
                    onClick: () {
                      viewModel.changePassword(
                          _controller1.text,
                          _controller2.text,
                          () {
                            Navigator.of(context).pop();
                          });
                    });
              }),
            ),
          )
        ]),
      ),
    );
  }
}
