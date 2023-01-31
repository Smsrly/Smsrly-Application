import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget{
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Stack(
          children: [
            Container(
              height: double.infinity,
              width:double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://user-images.githubusercontent.com/108674357/215354307-5c8a0a80-64b4-4705-a44a-738c6585573a.png")
                  ,fit: BoxFit.cover),
              ),
            ),
            Container(  height: double.infinity,
              width:double.infinity,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            Container(
              width: 372,
              height: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://user-images.githubusercontent.com/108674357/215356396-4c68311c-3ca3-46c8-848d-33a5bab5630b.png",

                      )
                  )
              ),
            ),
           Container(margin: EdgeInsets.only(left: 85,top: 550,right: 70),
             child: Column(mainAxisAlignment: MainAxisAlignment.center,
               children: [
               SizedBox(
               width:220,
               height:50,
               child:  Container(
                 child: RaisedButton(
                   onPressed: () {},
                   child: Text("Get Started"),
                   textColor: Colors.white,
                   color: Color(0xFF0E5289),
                   shape: new RoundedRectangleBorder(
                     borderRadius: new BorderRadius.circular(10.0),
                   ),
                 ),
               ),
               )

               ],

             ),
           )
          ],
        )
    );
  }
}