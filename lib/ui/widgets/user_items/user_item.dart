import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/user.dart';


class UserItem extends StatelessWidget {
  String name;
  String? imageUrl;
  String phoneNumber;

  UserItem({super.key,required this.name,required this.phoneNumber,this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.h,
        margin: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 4.sp),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          color: Colors.white,
          elevation: 25,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
              height: 80.h,
              child: Row(children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: imageUrl != null
                      ? Image(
                          width: 60.w,
                          height: 60.h,
                          fit: BoxFit.cover,
                          image: NetworkImage(imageUrl!),
                        )
                      : Image.asset(
                          width: 60.w,
                          height: 60.h,
                          fit: BoxFit.cover,
                          StringManager.profilePlaceholder),
                ),
                7.w.wi,
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: StringManager.ibmPlexSans,
                      fontWeight: FontWeight.w500),
                ),
                const Expanded(flex: 1, child: SizedBox()),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(14, 82, 137, 0.18),
                        borderRadius: BorderRadius.circular(13)),
                    child: Image.asset(StringManager.phoneIconPath),
                  ),
                  onTap: () {
                    launch("tel://$phoneNumber");
                  },
                ),
              ])),
        ));
  }
}
