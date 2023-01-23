import 'package:flutter/material.dart';

class IconBottomBar extends StatefulWidget {
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
  State<IconBottomBar> createState() => _IconBottomBarState();
}

class _IconBottomBarState extends State<IconBottomBar> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: widget.isSelected ? widget.darkIcon : widget.lightIcon,
      iconSize: 20,
    );
  }
}
