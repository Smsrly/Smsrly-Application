import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/res/strings.dart';

import 'colors.dart';

class AppStyles {
  static TextStyle headline1 =
      _getIBMPlexSansFont(fontSize: 32.sp, fontWeight: FontWeight.w500);

  static TextStyle bodyText1 =
      _getIBMPlexSansFont(fontSize: 15.sp, fontWeight: FontWeight.w400);

  static TextStyle getBodyText1(Color color) {
    return _getIBMPlexSansFont(
        fontSize: 15.sp, fontWeight: FontWeight.w400, color: color);
  }

  static TextStyle bodyTextWithCursorColor = _getIBMPlexSansFont(
      fontSize: 15, fontWeight: FontWeight.w400, color: textFieldCursorColor);

  static TextStyle bodyText2 =
      _getIBMPlexSansFont(fontSize: 18.sp, fontWeight: FontWeight.w400);

  static TextStyle getBodyText2(Color color) {
    return _getIBMPlexSansFont(
        fontSize: 18.sp, fontWeight: FontWeight.w500, color: color
    );
  }

  static TextStyle bodyText3 =
      _getIBMPlexSansFont(fontSize: 16.sp, fontWeight: FontWeight.w400);

  static TextStyle _getIBMPlexSansFont(
      {required double fontSize,
      required FontWeight fontWeight,
      Color? color = Colors.black}) {
    return TextStyle(
        fontFamily: StringManager.ibmPlexSans,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color);
  }
}
