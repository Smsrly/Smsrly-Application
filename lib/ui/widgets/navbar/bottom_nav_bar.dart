import 'package:flutter/material.dart';

import 'bottombar_icon.dart';



class BottomNavBar extends StatelessWidget {
  final  List<Widget> icons;

  const BottomNavBar({Key? key, required this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 100,
            ),
          ],
          ),
      child:BottomAppBar(
          elevation: 1,
          child: SizedBox(
            height: 56,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: icons),
          ),
        ),
    );
  }
}

