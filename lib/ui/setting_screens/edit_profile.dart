import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/widgets/colors.dart';
import 'package:smsrly/ui/widgets/text_fields/rounded_text_field.dart';

import '../widgets/buttons/rounded_back_button.dart';

    
class Edit extends StatelessWidget {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 350.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.sp),
                          bottomRight: Radius.circular(30.sp))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: RoundedBackButton(
                            backgroundColor: const Color.fromRGBO(135, 169, 197, 0.6),
                            arrowColor: Colors.white,
                            iconSize: 15,
                            onClick: () {
                              Navigator.pop(context);
                            }
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 110.h, left: 15.w, right: 15.w),
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          right: 15, left: 15, top: 40, bottom: 15),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: BoxShadowColor,
                              blurRadius: 50.0,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Basic Information",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          RoundedTextField(cursorColor: primaryColor,label: "First Name",),
                          SizedBox(
                            height: 30.h,
                          ),
                          RoundedTextField(cursorColor: primaryColor,label: "Second Name",),
                          SizedBox(
                            height: 30.h,
                          ),
                          RoundedTextField(cursorColor: primaryColor,label: "Email",inputType: TextInputType.emailAddress,),
                          SizedBox(
                            height: 30.h,
                          ),
                          RoundedTextField(cursorColor: primaryColor,label: "Phone number",inputType: TextInputType.phone,),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Image.asset(
                            "assets/images/location.jpg",
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text('Submit'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 70.h),
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/SUIIIIIIIIIIII.jpg"),
                      )
                    ],
                  ),
                ),
              ],
            ),
        ),
    ));
  }
}
