import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeTextField extends StatelessWidget {

  TextEditingController? controller;
  BuildContext parentContext;
  Function()? onChanged;
  CodeTextField({Key? key,this.controller,required this.parentContext,this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      controller: controller,
      inputFormatters: [LengthLimitingTextInputFormatter(1)],
      onChanged: (value) {
        if (value.length == 1) {
          if(onChanged != null){
            onChanged!();
          }
          FocusScope.of(parentContext).nextFocus();
        }
      },
    );
  }
}
