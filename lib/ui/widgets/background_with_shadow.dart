import 'package:flutter/material.dart';

class ContainerWithShadow extends StatelessWidget {
  EdgeInsets? padding;
  double? height;
  late Widget child;
  late double width;
  ContainerWithShadow({Key? key, required this.child,required this.width , this.padding,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(216, 216, 216, 0.44)),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07450980392156863),
            blurRadius: 35.0,
          )
        ],
        borderRadius: BorderRadius.circular(18),
      ),
      child: child,
    );
  }
}
