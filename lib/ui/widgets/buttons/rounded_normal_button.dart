import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  late String text;
  late VoidCallback onClick;
  RoundedButton({Key? key,required this.text,required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(14, 82, 137, 1),
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
