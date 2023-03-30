import 'package:flutter/material.dart';
import 'package:smsrly/res/colors.dart';

class RoundedButton extends StatelessWidget {
  late String text;
  late VoidCallback onClick;
  RoundedButton({Key? key,required this.text,required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(text),
      ),
    );
  }
}
