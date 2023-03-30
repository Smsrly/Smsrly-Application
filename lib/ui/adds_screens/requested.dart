import 'package:flutter/material.dart';
import 'package:smsrly/res/strings.dart';
import '../../models/realestate.dart';
import '../../utils/routes/route_name.dart';
import '../widgets/realestates_items/realestate_third_item.dart';

class Requested extends StatelessWidget{
  RealEstate item2 = RealEstate(
      122,
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/lpibo-ew-1656015868.jpg",
      "Royal Sea Crown2",
      null,
      "123",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      1231,
      54,
      5,
      5,
      100000,
      21321.3,
      1231.2,
      "Egypt",
      "Cairo",0);


  void navigateToShowDetail(BuildContext context){
    Navigator.pushNamed(context, RouteName.showDetailsRoute,arguments: {
      StringManager.item: item2,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 10,),
              InkWell(
                  child: ThirdItem(realEstate: item2,isTheOwner: false,hasSaved: false),
                  onTap: (){
                    navigateToShowDetail(context);
                  },
              ),
              InkWell(
                child: ThirdItem(realEstate: item2,isTheOwner: false,hasSaved: false),
                onTap: (){
                  navigateToShowDetail(context);
                },
              ),
              InkWell(
                child: ThirdItem(realEstate: item2,isTheOwner: false,hasSaved: true),
                onTap: (){
                 navigateToShowDetail(context);
                },
              ),            ],
          ),

        ],
      )
    );
  }
}