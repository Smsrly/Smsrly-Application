import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/setting_screens/contact_us.dart';
import 'package:smsrly/ui/widgets/colors.dart';
import 'password_dialog.dart';
import 'edit_profile.dart';


class Setting extends StatelessWidget {

  void showDeleteDialog(BuildContext context){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.topSlide,
      title: "Delete Account !",
      desc:
      "Are you sure that you want to delete your account ?",
      btnCancelOnPress: () => print("Canceled"),
      btnOkOnPress: () => print("Ok"),
    ).show();
  }


  Widget settingRow(String text, IconData icon, VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.sp),
        ),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 25.sp,
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 45.h, horizontal: 20.w),
                    height: 300.h,
                    decoration: BoxDecoration(
                        color:   primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.sp),
                            bottomRight: Radius.circular(30.sp))),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 40.sp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Setting",
                            style: TextStyle(
                                fontFamily: 'IBMPlexSans',
                                fontWeight: FontWeight.bold,
                                fontSize: 26.sp,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                    margin:
                        EdgeInsets.only(top: h / 5, right: 20.w, left: 20.w),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: boxShadowColor,
                            blurRadius: 50.0,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.h))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              color: borderSideColor,
                              width: 0.4.w,
                            ),
                          )),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                  radius: 26,
                                  backgroundImage:
                                      AssetImage("assets/images/SUIIIIIIIIIIII.jpg")),
                              SizedBox(
                                width: 15.h,
                              ),
                              Text(
                                "Cristiano Ronaldo",
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Account Settings",
                              style: TextStyle(
                                  color: offWhite ,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        settingRow("Edit Profile", Icons.arrow_forward_ios, () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Edit()));
                        }),
                        SizedBox(
                          height: 13.h,
                        ),
                        settingRow("Change Password", Icons.arrow_forward_ios, () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return PasswordDialog(
                                onSubmit: () {
                                  print('Ok');
                                },
                              );
                            },
                          );
                        }),
                        SizedBox(
                          height: 13.h,
                        ),
                        // settingRow("Dark Mode", Icons.dark_mode_outlined, () {}),
                        SizedBox(
                          height: 13.h,
                        ),

                        Text(
                          "More",
                          style: TextStyle(
                              color:offWhite,
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp),
                        ),

                        SizedBox(
                          height: 13.h,
                        ),
                        settingRow("Contact us", Icons.arrow_forward_ios, () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return const ContactUs();
                          }));
                        }),
                        SizedBox(
                          height: 13.h,
                        ),
                        settingRow("Log out", Icons.logout, () {}),
                        SizedBox(
                          height: 13.h,
                        ),
                        settingRow("Delete Account", Icons.arrow_forward_ios, () {
                          showDeleteDialog(context);
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
