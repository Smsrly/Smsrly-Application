import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';

class PasswordDialog extends StatelessWidget {

  const PasswordDialog({super.key});


  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
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
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {

                          },
                          child: true == true
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
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {
                          },
                          child: true == true
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
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {
                          },
                          child: true == true
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
                onClick: () {

                },
                text: StringManager.submit,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
