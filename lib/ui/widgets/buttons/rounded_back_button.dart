import 'package:flutter/material.dart';

class RoundedBackButton extends StatelessWidget {
  late Color backgroundColor;
  late Color arrowColor;
  double? iconSize=18;
  late VoidCallback onClick;

  RoundedBackButton(
      {Key? key,
      required this.backgroundColor,
      required this.arrowColor,
      required this.onClick,
      this.iconSize
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(13)),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              color: arrowColor,
              size: iconSize,
            ),
          ),
        ));
  }
}
