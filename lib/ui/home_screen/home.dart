import 'package:flutter/material.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/ui/realestates_items/realestate_first_item.dart';

import '../../models/location.dart';
import '../../models/realestate.dart';
import '../realestates_items/realestate_second_item.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
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
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(14, 82, 137, 1)),
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
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Common Real Estates",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                        onPressed: widget.seeAllAction,
                        child: const Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(68, 68, 68, 0.7)),
                        ))
                  ],
                ),
              ),
              SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: widget.items.length!~/3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      RealEstate currItem= widget.items[widget.IDs[index]]!;
                      return InkWell(
                        child: FirstItem(
                          item: currItem,
                          hasSaved: widget.user.isSaved(currItem),
                          onSaveIconSelected: () {
                            setState(() {
                              print('before : ${widget.user.isSaved(currItem)}');
                              print(currItem.realEstateId);
                              if (widget.user.isSaved(currItem)) {
                                widget.user.unSaveRealEstate(currItem);
                              } else {
                                widget.user.saveRealEstate(currItem);
                              }
                              print("after : ${widget.user.isSaved(currItem)}");
                            });
                          },
                        ),
                        onTap: (){
                          // go to show detail
                        },
                      );
                    },
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "More",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                        onPressed: widget.seeAllAction,
                        child: const Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(68, 68, 68, 0.7)),
                        ))
                  ],
                ),
              ),
              SizedBox(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.items.length! - widget.items.length!~/3,
                    itemBuilder: (context, index) {
                      int currIndex = index+widget.items.length!~/3;
                      RealEstate currItem= widget.items[widget.IDs[currIndex]]!;
                      return InkWell(
                        child: SecondItem(
                          item: currItem,
                          hasSaved: widget.user.isSaved(currItem),
                          onSaveBtn: () {
                            setState(() {
                              print(currItem.realEstateId);
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
                        },
                      );
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