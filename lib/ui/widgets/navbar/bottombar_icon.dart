import 'package:flutter/material.dart';

class IconBottomBar extends StatelessWidget {
  Widget darkIcon;
  Widget lightIcon;
  bool isSelected;
  VoidCallback onPressed;

  IconBottomBar(
      {Key? key,
        required this.lightIcon,
        required this.darkIcon,
        required this.isSelected,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: isSelected ? darkIcon : lightIcon,
      iconSize: 20,
    );
  }
}