import 'package:flutter/material.dart';
import 'package:smsrly/ui/setting_screens/setting.dart';

class contact extends StatefulWidget{

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(padding: EdgeInsets.only(top: 35,left: 25),width: double.infinity,
        child:Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>setting()));
            }, icon: Icon(Icons.arrow_back_ios,)),
        SizedBox(height: 25,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Get in touch with us",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
                ),
                SizedBox(height: 25,),
                Text("We are happy to have contact with us and sorry for the problem that faces youand we will work to solve it",
                style: TextStyle(
                  fontSize: 15
                ),
                ),
                SizedBox(height: 55,),
                Text("What do you want to talk about",
                  style: TextStyle(
                      fontSize: 15,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 55,),
                Text("Your message",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  )
                ),
                TextFormField(
                  decoration: InputDecoration(
 
                  ),
                )
              ],

            )
          ],
        )
      ),
    );
  }
}