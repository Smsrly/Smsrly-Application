import 'package:flutter/material.dart';

import '../../models/location.dart';
import '../../models/realestate.dart';
import '../show_details/show_detail.dart';
import '../widgets/realestates_items/realestate_third_item.dart';

class Saved extends StatelessWidget{
  RealEstate item1 = RealEstate(
      123,
      "https://www.travelandleisure.com/thmb/HaAgtnns6Cp6Tb08MJq8xXOHzH0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/soneva-jani-sunset-view-maldives-SONEVA0421-74b37591d80441ce87831a41da518e49.jpg",
      "Royal Sea Crown1",
      null,
      "123",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      1231,
      54,
      5,
      5,
      100000,
      Location(21321.3, 1231.2),
      "Egypt",
      "Alex",1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          const SizedBox(height: 10,),
          InkWell(onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (builder){
              return ShowDetail(item: item1);
            }));
          },child: ThirdItem(realEstate: item1,isTheOwner: false,hasSaved: true)),
          InkWell(onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (builder){
              return ShowDetail(item: item1);
            }));
          },child: ThirdItem(realEstate: item1,isTheOwner: false,hasSaved: true)),
          InkWell(onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (builder){
              return ShowDetail(item: item1);
            }));
          },child: ThirdItem(realEstate: item1,isTheOwner: false,hasSaved: true))
        ],
      )
    );
  }
}