import 'package:flutter/material.dart';



class BottomNavBar extends StatelessWidget {
  final  List<IconBottomBar> icons;

  const BottomNavBar({Key? key, required this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0))),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(18.0),
          topLeft: Radius.circular(18.0),
        ),
        child: BottomAppBar(
          elevation: 5,
          child: SizedBox(
            height: 56,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: icons),
          ),
        ),
      ),
    );
  }
}

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
