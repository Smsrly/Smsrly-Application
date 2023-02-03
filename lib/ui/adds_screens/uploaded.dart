import 'package:flutter/material.dart';
import 'package:smsrly/ui/widgets/realestates_items/realestate_third_item.dart';

import '../../models/location.dart';
import '../../models/realestate.dart';
import '../../models/user.dart';

class Uploaded extends StatelessWidget{
  RealEstate item3 = RealEstate(
      123,
      "https://pix8.agoda.net/hotelImages/2163054/-1/4f3b334212d6cf837f60ee731edf916d.jpg",
      "Royal Sea Crown3",
      null,
      "123",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      1231,
      54,
      5,
      5,
      100000,
      Location(21321.3, 1231.2),
      "Morocco",
      "Elrbat",1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       ListView(
         children: [
           const SizedBox(height: 10,),
           ThirdItem(realEstate: item3,isTheOwner: true,hasSaved: false),
           ThirdItem(realEstate: item3,isTheOwner: true,hasSaved: false),
           ThirdItem(realEstate: item3,isTheOwner: true,hasSaved: false)
         ],
       )
    );
  }
}