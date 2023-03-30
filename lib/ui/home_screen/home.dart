import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/show_details/show_detail.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/colors.dart';

import '../../models/realestate.dart';
import '../../utils/routes/route_name.dart';
import '../widgets/realestates_items/realestate_first_item.dart';
import '../widgets/realestates_items/realestate_second_item.dart';

class HomeScreen extends StatelessWidget {


  HomeScreen({Key? key}) : super(key: key);

  Widget header(){
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringManager.welcome,
                style: TextStyle(
                    fontSize: 13,
                    color: welcomeMessageColor),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Totti',
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              )
            ],
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.thefamouspeople.com/profiles/images/francesco-totti-1.jpg'),
            ),
          ),
        ],
      ),
    );
  }

  Widget seeAllRow(String title){
    return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      child: Text(
                        StringManager.see,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(68, 68, 68, 0.7)),
                      ))
                ],
              ),
          );
  }

  Widget firstItem(RealEstate currItem,BuildContext context){
    return InkWell(
            child: FirstItem(
              item: currItem,
              hasSaved: false,
              onSaveIconSelected: () {

              },
            ),
            onTap: (){
              // go to show detail
              Navigator.pushNamed(context, RouteName.showDetailsRoute,arguments: {
                StringManager.item: currItem
              });
            },
        );
  }

  Widget secondItem(RealEstate currItem ,BuildContext context){
    return InkWell(
              child: SecondItem(
                item: currItem,
                hasSaved: true,
                onSaveBtn: () {

                },
              ),
              onTap: (){
                // go to show details
                Navigator.pushNamed(context, RouteName.showDetailsRoute,arguments: {
                  StringManager.item : currItem
                });
              },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              SizedBox(
                height: 10.h,
              ),
              seeAllRow(StringManager.common),
              SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: 10, // widget.items.length~/3
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return firstItem(
                          RealEstate(
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
                          "Cairo",0)
                      ,context);
                    },
                  )
              ),
              seeAllRow(StringManager.more),
              SizedBox(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,  // widget.items.length - widget.items.length~/3
                    itemBuilder: (context, index) {
                      // int currIndex = index+widget.items.length~/3;
                      // RealEstate currItem= widget.items[currIndex];
                      return secondItem(
                          RealEstate(
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
                          "Cairo",0)
                      ,context);
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}