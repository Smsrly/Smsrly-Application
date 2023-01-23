import 'package:flutter/material.dart';
void main(){
  runApp(App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(),
        bottomNavigationBar: const BottomNavigationBar(),
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0) ,topRight: Radius.circular(18.0))
      ),
      child:  ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(18.0),
          topLeft: Radius.circular(18.0),
        ),
        child: BottomAppBar(

          elevation: 2,
          child: SizedBox(
            height: 56,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

              ],
            ),
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
   IconBottomBar({Key? key,required this.lightIcon, required this.darkIcon, required this.isSelected, required this.onPressed}) : super(key: key);

  @override
  State<IconBottomBar> createState() => _IconBottomBarState();
}

class _IconBottomBarState extends State<IconBottomBar> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:(){
      setState(() {
        widget.isSelected=!widget.isSelected;
      });
      widget.onPressed();
    }, icon: widget.isSelected?widget.darkIcon:widget.lightIcon,);
  }
}

