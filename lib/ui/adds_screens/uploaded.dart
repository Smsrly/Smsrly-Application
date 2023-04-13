import 'package:flutter/material.dart';
import 'package:smsrly/ui/widgets/realestates_items/realestate_third_item.dart';

import '../../models/realestate.dart';
import '../../res/strings.dart';
import '../../utils/routes/route_name.dart';

class Uploaded extends StatelessWidget{




  void navigateToShowDetail(BuildContext context){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       ListView(
         children: [
           const SizedBox(height: 10,),

           // InkWell(child: ThirdItem(realEstate: item3,isTheOwner: true,hasSaved: false),onTap: (){
           //   navigateToShowDetail(context);
           // })
         ],
       )
    );
  }
}