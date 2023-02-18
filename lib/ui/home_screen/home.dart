import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/ui/show_details/show_detail.dart';

import '../../models/realestate.dart';
import '../widgets/realestates_items/realestate_first_item.dart';
import '../widgets/realestates_items/realestate_second_item.dart';

class HomeScreen extends StatefulWidget {

  late Map<int, RealEstate> items;
  late List<int> IDs;
  late User user;
  late VoidCallback seeAllAction;

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  void initState() {
    super.initState();
  }







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
                "Welcome, ",
                style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(115, 115, 115, 1)),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                widget.user.username,
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(14, 82, 137, 1)),
              )
            ],
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.user.pictureUrl),
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
                      onPressed: widget.seeAllAction,
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(68, 68, 68, 0.7)),
                      ))
                ],
              ),
          );
  }




  Widget firstItem(RealEstate currItem){
    return InkWell(
            child: FirstItem(
              item: currItem,
              hasSaved: widget.user.isSaved(currItem),
              onSaveIconSelected: () {
                setState(() {

                  if (widget.user.isSaved(currItem)) {
                    widget.user.unSaveRealEstate(currItem);
                  } else {
                    widget.user.saveRealEstate(currItem);
                  }
                });
              },
            ),
            onTap: (){
              // go to show detail
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_){
                    return ShowDetail(item: currItem);
                  })
              );
            },
        );
  }




  Widget secondItem(RealEstate currItem){
    return InkWell(
              child: SecondItem(
                item: currItem,
                hasSaved: widget.user.isSaved(currItem),
                onSaveBtn: () {
                  setState(() {
                    if (widget.user.isSaved(currItem)) {
                      widget.user.unSaveRealEstate(currItem);
                    } else {
                      widget.user.saveRealEstate(currItem);
                    }
                  });
                },
              ),
              onTap: (){
                // go to show details
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_){
                      return ShowDetail(item: currItem);
                    })
                );
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
              seeAllRow("Common Real Estates"),
              SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: widget.items.length~/3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      RealEstate currItem= widget.items[widget.IDs[index]]!;
                      return firstItem(currItem);
                    },
                  )
              ),
              seeAllRow("More"),
              SizedBox(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.items.length - widget.items.length~/3,
                    itemBuilder: (context, index) {
                      int currIndex = index+widget.items.length~/3;
                      RealEstate currItem= widget.items[widget.IDs[currIndex]]!;
                      return secondItem(currItem);
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