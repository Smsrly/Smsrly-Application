import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/res/strings.dart';

import 'colors.dart';

class AppStyles {
  static TextStyle headline1 =
  _getIBMPlexSansFont(fontSize: 32.sp, fontWeight: FontWeight.w500);

  static TextStyle headline2 =
  _getIBMPlexSansFont(fontSize: 25, fontWeight: FontWeight.w500,color: primaryColor);

  static TextStyle headline3 =
  _getIBMPlexSansFont(fontSize: 25, fontWeight: FontWeight.w500,color: primaryColor);

  static TextStyle headline4 =
  _getIBMPlexSansFont(fontSize: 25.sp, fontWeight: FontWeight.w500,color: primaryColor);
  static TextStyle headline5 =
  _getIBMPlexSansFont(fontSize: 25.sp, fontWeight: FontWeight.w500,color: Colors.black);

  static TextStyle headline7 =
  _getIBMPlexSansFont(fontSize: 17, fontWeight: FontWeight.w500,color: primaryColor);

  static TextStyle bodyText1 =
  _getIBMPlexSansFont(fontSize: 12.sp, fontWeight: FontWeight.w400);

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

  static TextStyle bodyText4 =
  _getIBMPlexSansFont(fontSize: 15, fontWeight: FontWeight.w400,color: failedSearchTextColor);

  static TextStyle bodyText5 =
  _getIBMPlexSansFont(fontSize: 18, fontWeight: FontWeight.w500);

  static TextStyle bodyText6 =
  _getIBMPlexSansFont(fontSize: 17.sp, fontWeight: FontWeight.w400);


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
  static const TextStyle title1=
  TextStyle(fontSize: 28,fontWeight: FontWeight.bold);

  static  TextStyle showModalTextStyle2=
  _getIBMPlexSansFont(fontSize: 20,fontWeight: FontWeight.bold);
}
