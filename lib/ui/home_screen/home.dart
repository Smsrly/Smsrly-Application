import 'package:flutter/material.dart';
import 'package:smsrly/models/user.dart';

import '../../models/realestate.dart';

class HomeScreen extends StatefulWidget {
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
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Welcome, ",style: TextStyle(fontSize: 13,color: Color.fromRGBO(115, 115, 115,  1)),),
                        const SizedBox(height: 2,),
                        Text(widget.user.username,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color.fromRGBO(14, 82, 137,  1)),)
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

                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Common Real Estates",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,),),
                    TextButton(onPressed: widget.seeAllAction, child: const Text("See all",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color.fromRGBO(68, 68, 68 ,0.7)),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
