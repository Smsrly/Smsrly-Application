import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/res/colors.dart';

class PasswordDialog extends StatefulWidget {
  late Function onSubmit;

  PasswordDialog({super.key, required this.onSubmit});

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  bool currentPasswordIsHide = true;
  bool newPasswordIsHide = true;
  bool confirmPasswordIsHide = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 430.h,
        width: 300.w,
        child: Column(children: [
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
                alignment: AlignmentDirectional.topEnd,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26),
            child: Container(
              alignment: Alignment.center,
              child: Text(StringManager.privacy,
                  style: AppStyles.bodyText3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(StringManager.currentPass,
                  style: TextStyle(fontSize: 16.sp, color: Colors.black)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: SizedBox(
                height: 50.h,
                child: TextField(
                  obscureText: currentPasswordIsHide,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () => setState(() {
                                currentPasswordIsHide = !currentPasswordIsHide;
                              }),
                          child: currentPasswordIsHide == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)))),
                ),
              )),
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
                child: TextField(
                  obscureText: newPasswordIsHide,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () => setState(() {
                                newPasswordIsHide = !newPasswordIsHide;
                              }),
                          child: newPasswordIsHide == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)))),
                ),
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
                child: TextField(
                  obscureText: confirmPasswordIsHide,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () => setState(() {
                                confirmPasswordIsHide = !confirmPasswordIsHide;
                              }),
                          child: confirmPasswordIsHide == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)))),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(14),
            child: SizedBox(
              width: double.infinity,
              child: RoundedButton(
                onClick: () => widget.onSubmit(),
                text: StringManager.submit,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
