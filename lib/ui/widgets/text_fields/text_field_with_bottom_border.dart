import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../res/colors.dart';

class TextFieldWithBottomBorder extends StatelessWidget {
  
  TextInputType? inputType = TextInputType.text;
  late String label;
  late double fontSize;
  TextEditingController? controller = TextEditingController();
  List<TextInputFormatter>? inputFormatter =[];
  Function(String)? onTextChanged;
  final Widget? prefixIcon;
  IconButton? suffixIcon;
  bool? obscureText;

  TextFieldWithBottomBorder(
      {Key? key,
      required this.label,
      this.inputType,
      this.controller,
      this.inputFormatter,
      this.prefixIcon,
      required this.fontSize,
      this.onTextChanged, 
      this.suffixIcon,
      this.obscureText,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: textFieldCursorColor,
      keyboardType: inputType,
      obscureText: obscureText ?? false,
      onChanged: onTextChanged,
      inputFormatters: inputFormatter,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(
            fontSize: fontSize, color: textFieldCursorColor
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: textFieldEnabledBorderColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
