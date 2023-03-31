import 'package:flutter/material.dart';
import 'package:smsrly/res/colors.dart';

class RoundedButton extends StatelessWidget {
  late String text;
  late VoidCallback onClick;
  bool? visible;

  RoundedButton(
      {Key? key,
      required this.text,
      required this.onClick,
      this.visible = true})
      : super(key: key);

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
        child: visible! ? Text(text) : const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white
          ),
        ),
      ),
    );
  }
}
