import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(14, 82, 137, 1);
const blackWithMediumOpacity = Color.fromRGBO(0, 0, 0, 0.5);
const textFieldCursorColor = Color.fromRGBO(124, 124, 124, 1);
const textFieldEnabledBorderColor = Color.fromRGBO(170, 171, 170, 1);
const boxShadowColor = Color.fromRGBO(0, 0, 0, 0.15);
const borderSideColor=  Color.fromRGBO(202, 202, 202, 1);
const offWhite =  Color(0xFFADADAD);
const welcomeMessageColor = Color.fromRGBO(115, 115, 115, 1);

TextStyle getIBMPlexSansFont(double fontSize,FontWeight fontWeight){
  return TextStyle(fontFamily: 'IBMPlexSans',fontSize: fontSize,fontWeight: fontWeight);
}