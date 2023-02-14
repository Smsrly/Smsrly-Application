import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class TextFieldWithBottomBorder extends StatelessWidget {
  TextInputType? inputType = TextInputType.text;
  late String label;
  late double fontSize;
  TextEditingController? controller = TextEditingController();
  List<TextInputFormatter>? inputFormatter =[];
  final Widget? prefixIcon;
  TextFieldWithBottomBorder({Key? key,required this.label,this.inputType,this.controller,this.inputFormatter,this.prefixIcon,required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: const Color.fromRGBO(124, 124, 124, 1),
      keyboardType: inputType,
      inputFormatters: inputFormatter,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,

        labelStyle: TextStyle(
            fontSize: fontSize, color: const Color.fromRGBO(124, 124, 124, 1)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(14, 82, 137, 1),
            width: 2,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(170, 171, 170, 1),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
