import 'package:flutter/material.dart';

import '../../../res/strings.dart';

class GoogleLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  bool? visible;

  get isVisible {
    return visible ?? false;
  }

  GoogleLoginButton(
      {Key? key, required this.text, required this.onClick, visible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onClick,
      icon: Container(
        margin: const EdgeInsets.only(right: 10),
          height: 30, width: 30, child: Image.asset(StringManager.googleImage)),
      label: !isVisible ? Text(text) : const CircularProgressIndicator(),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}
