import 'package:flutter/material.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/ui/realestates_items/realestate_first_item.dart';

import '../../models/location.dart';
import '../../models/realestate.dart';
import '../realestates_items/realestate_second_item.dart';

class HomeScreen extends StatefulWidget {
  RealEstate item = RealEstate(
      123,
      "https://www.travelandleisure.com/thmb/HaAgtnns6Cp6Tb08MJq8xXOHzH0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/soneva-jani-sunset-view-maldives-SONEVA0421-74b37591d80441ce87831a41da518e49.jpg",
      "Royal Sea Crown",
      null,
      "123",
      "asdasd",
      1231.1,
      54,
      5,
      5,
      21313.1,
      Location(21321.3, 1231.2),
      "Egypt, Alex");
  late List<RealEstate> realEstates;
  late User user;
  late VoidCallback seeAllAction;

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10, top: 10),
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
                  padding: const EdgeInsets.only(left: 10,right: 10),
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
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Row(
                      children: [
                        FirstItem(
                          item: widget.item,
                          hasSaved: widget.user.isSaved(widget.item),
                          onSaveIconSelected: () {
                            setState(() {
                              if (widget.user.isSaved(widget.item)) {
                                widget.user.unSaveRealEstate(widget.item);
                              } else {
                                widget.user.saveRealEstate(widget.item);
                              }
                            });
                          },
                        ),
                        FirstItem(
                          item: widget.item,
                          hasSaved: widget.user.isSaved(widget.item),
                          onSaveIconSelected: () {
                            setState(() {
                              if (widget.user.isSaved(widget.item)) {
                                widget.user.unSaveRealEstate(widget.item);
                              } else {
                                widget.user.saveRealEstate(widget.item);
                              }
                            });
                          },
                        ),
                        FirstItem(
                          item: widget.item,
                          hasSaved: widget.user.isSaved(widget.item),
                          onSaveIconSelected: () {
                            setState(() {
                              if (widget.user.isSaved(widget.item)) {
                                widget.user.unSaveRealEstate(widget.item);
                              } else {
                                widget.user.saveRealEstate(widget.item);
                              }
                            });
                          },
                        ),
                        FirstItem(
                          item: widget.item,
                          hasSaved: widget.user.isSaved(widget.item),
                          onSaveIconSelected: () {
                            setState(() {
                              if (widget.user.isSaved(widget.item)) {
                                widget.user.unSaveRealEstate(widget.item);
                              } else {
                                widget.user.saveRealEstate(widget.item);
                              }
                            });
                          },
                        ),
                        FirstItem(
                          item: widget.item,
                          hasSaved: widget.user.isSaved(widget.item),
                          onSaveIconSelected: () {
                            setState(() {
                              if (widget.user.isSaved(widget.item)) {
                                widget.user.unSaveRealEstate(widget.item);
                              } else {
                                widget.user.saveRealEstate(widget.item);
                              }
                            });
                          },
                        ),
                      ],
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
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
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          SecondItem(
                            item: widget.item,
                            hasSaved: widget.user.isSaved(widget.item),
                            onSaveBtn: (){
                              setState(() {
                                if (widget.user.isSaved(widget.item)) {
                                  widget.user.unSaveRealEstate(widget.item);
                                } else {
                                  widget.user.saveRealEstate(widget.item);
                                }
                              });
                            },
                          ),
                          SecondItem(
                              item: widget.item,
                              hasSaved: widget.user.isSaved(widget.item),
                              onSaveBtn: (){
                                setState(() {
                                  if (widget.user.isSaved(widget.item)) {
                                    widget.user.unSaveRealEstate(widget.item);
                                  } else {
                                    widget.user.saveRealEstate(widget.item);
                                  }
                                });
                              },
                          ),
                          SecondItem(
                              item: widget.item,
                              hasSaved: widget.user.isSaved(widget.item),
                              onSaveBtn: (){
                                setState(() {
                                  if (widget.user.isSaved(widget.item)) {
                                    widget.user.unSaveRealEstate(widget.item);
                                  } else {
                                    widget.user.saveRealEstate(widget.item);
                                  }
                                });
                              },
                          ),
                          SecondItem(
                              item: widget.item,
                              hasSaved: widget.user.isSaved(widget.item),
                              onSaveBtn: (){
                                setState(() {
                                  if (widget.user.isSaved(widget.item)) {
                                    widget.user.unSaveRealEstate(widget.item);
                                  } else {
                                    widget.user.saveRealEstate(widget.item);
                                  }
                                });
                              },
                          ),
                          SecondItem(
                              item: widget.item,
                              hasSaved: widget.user.isSaved(widget.item),
                              onSaveBtn: (){
                                setState(() {
                                  if (widget.user.isSaved(widget.item)) {
                                    widget.user.unSaveRealEstate(widget.item);
                                  } else {
                                    widget.user.saveRealEstate(widget.item);
                                  }
                                });
                              },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
