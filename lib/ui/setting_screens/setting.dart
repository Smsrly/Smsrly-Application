import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/setting_screens/contactUs.dart';
import 'password_dialog.dart';
import 'editProfile.dart';

class Setting extends StatelessWidget {
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
                        color: Color(0xFF0E5289),
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
                    margin: EdgeInsets.only(top: h / 5, right: 20.w, left: 20.w),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
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
                              color: const Color.fromRGBO(202, 202, 202, 1),
                              width: 0.4.w,
                            ),
                          )),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                  radius: 26,
                                  backgroundImage:
                                      AssetImage("images/SUIIIIIIIIIIII.jpg")),
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
                                  color: const Color(0xFFADADAD),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Edit Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20.sp),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Edit()));
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25.sp,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Change Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20.sp),
                            ),
                            IconButton(
                                onPressed: () {
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
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25.sp,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dark Mode",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20.sp),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.dark_mode_outlined,
                                  size: 25.sp,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Text(
                          "More",
                          style: TextStyle(
                              color: const Color(0xFFADADAD),
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Contact us",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20.sp),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                    return const ContactUs();
                                  }));
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25.sp,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Log out",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20.sp),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.logout,
                                  size: 25.sp,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delete Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20.sp),
                            ),
                            IconButton(
                                onPressed: () {
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
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25.sp,
                                ))
                          ],
                        )
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
