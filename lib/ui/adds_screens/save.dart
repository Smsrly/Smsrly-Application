import 'package:flutter/material.dart';

import '../../models/realestate.dart';
import '../../res/strings.dart';
import '../../utils/routes/route_name.dart';
import '../widgets/realestates_items/realestate_third_item.dart';

class Saved extends StatelessWidget{



  void navigateToShowDetail(BuildContext context){

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          const SizedBox(height: 10,),

          // InkWell(onTap:(){
          //   navigateToShowDetail(context);
          //
          // },child: ThirdItem(realEstate: item1,isTheOwner: false,hasSaved: true))
        ],
      )
    );
  }
}