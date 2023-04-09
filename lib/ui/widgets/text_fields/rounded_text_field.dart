import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  double? fontSize;
  TextInputType? inputType = TextInputType.text;
  String? label;

  TextEditingController? controller = TextEditingController();
  Color? cursorColor;
  TextStyle? textStyle;
  Function(String)? onChange;
  IconData? suffixIcon;
  bool? obscureText;
  Function()? onClickSuffixIcon;
  bool get isObscure{
    return obscureText ?? false;
  }

  RoundedTextField(
      {Key? key,
        this.fontSize,
        this.onChange,
        this.onClickSuffixIcon,
        this.label,
        this.inputType,
        this.controller,
        required this.cursorColor,
        this.textStyle,
        this.suffixIcon,
        this.obscureText
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        onChanged: onChange,
        style: textStyle,
        obscureText: isObscure,
        keyboardType: inputType,
        cursorColor: cursorColor,

        decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: onClickSuffixIcon, icon: Icon(suffixIcon)),
          labelText: label,
          labelStyle: TextStyle(fontSize: fontSize),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(
              color: Color.fromRGBO(14, 82, 137, 1),
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(
                color: Color.fromRGBO(170, 171, 170, 1), width: 1.5),
          ),
        ));
  }
}
