import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

class UserItem extends StatelessWidget {
  late User user;

  UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.h,
        margin: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 4.sp),
        child:Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          color: Colors.white,
          elevation: 25,
          child: SizedBox(
              height: 80.h,
              child: Row(children: [
                Container(
                    decoration:
                        BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                      image: NetworkImage(user.pictureUrl),
                    )),
                SizedBox(width: 7.w,),
                Text(user.username,style: TextStyle(fontSize: 18.sp,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w500),),
                const Expanded(flex:1,child: SizedBox()),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(14, 82, 137, 0.18),
                        borderRadius: BorderRadius.circular(13)
                    ),
                    child: Image.asset("assets/images/call_icon.png"),

                  ),
                  onTap: (){
                    launch("tel://${user.phoneNumber}");
                  },
                ),
              ])),
        ));
  }
}
