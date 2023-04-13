import 'package:flutter/material.dart';
import 'package:smsrly/res/strings.dart';
import '../../models/realestate.dart';
import '../../utils/routes/route_name.dart';
import '../widgets/realestates_items/realestate_third_item.dart';

class Requested extends StatelessWidget{


  void navigateToShowDetail(BuildContext context){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 10,),

              // InkWell(
              //   child: ThirdItem(realEstate: item2,isTheOwner: false,hasSaved: true),
              //   onTap: (){
              //    navigateToShowDetail(context);
              //   },
              // ),
            ],
          ),

        ],
      )
    );
  }
}