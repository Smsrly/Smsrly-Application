import 'package:flutter/material.dart';

import 'requested.dart';
import 'save.dart';
import 'uploaded.dart';

class MyAdds extends StatefulWidget{
  @override
  State<MyAdds> createState() => _MyAddsState();
}

class _MyAddsState extends State<MyAdds> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child:
    Scaffold(
      appBar: AppBar(toolbarHeight: 70,backgroundColor:Colors.blue[800],title: Text("My Adds"),
        bottom:TabBar(indicatorWeight:5,
          tabs: [
            Text("Uploaded",style: TextStyle(fontSize: 19),),
            Text("Requested",style: TextStyle(fontSize: 17),),
            Text("Saved",style: TextStyle(fontSize: 19),)
          ],

        ) ,),
      body: TabBarView(
        children: [
          Uploaded(),
          Requested(),
          Saved()
        ],
      ),
    )
    );
  }
}