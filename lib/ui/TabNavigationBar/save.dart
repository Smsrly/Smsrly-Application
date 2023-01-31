import 'package:flutter/material.dart';

class Saved extends StatefulWidget{
  @override
  State<Saved> createState() => _SaveState();
}

class _SaveState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 10,),
              Container(margin: EdgeInsets.only(left: 10,right: 10),
                width: double.infinity,
                child:
                Container(
                  child: Card(elevation: 15,shape:RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                    child: Container(decoration: const BoxDecoration(
                      borderRadius:   BorderRadius.all(Radius.circular(23)),
                      image: DecorationImage(
                          image: NetworkImage("https://user-images.githubusercontent.com/108674357/214273636-b338f7d4-a9fa-45da-9526-60b76271d25c.jpg"),
                          fit: BoxFit.cover),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 12),
                        child:
                        Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Royal Sea house"),
                                SizedBox(width: 155,),
                                Container(width: 50,
                                  child: Row(
                                    children: [
                                      Expanded(child: SizedBox(),flex: 1,),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.save,color: Colors.white,size:16,)),
                                      Expanded(child: SizedBox(),flex: 1,),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 1,),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                Text("Egypt,Alex")
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.area_chart),
                                Text("150m^2")
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.stairs),
                                Text("4")
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.shower_outlined),
                                SizedBox(width: 0,),
                                Text("4")
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.bed),
                                Text("4"),
                                SizedBox(width: 230,),
                                Container(width: 50,
                                  padding: EdgeInsets.only(left: 2),
                                  decoration: BoxDecoration(
                                      color:Color.fromRGBO(135, 169, 197, 0.6),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(child: SizedBox(),flex: 1,),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.arrow_forward_ios,color: Colors.white,size:16,)),
                                      Expanded(child: SizedBox(),flex: 1,),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(margin: EdgeInsets.only(left: 10,right: 10),
                width: double.infinity,
                child:
                Container(
                  child: Card(elevation: 15,shape:RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                    child: Container(decoration: const BoxDecoration(
                      borderRadius:   BorderRadius.all(Radius.circular(23)),
                      image: DecorationImage(
                          image: NetworkImage("https://user-images.githubusercontent.com/108674357/214273636-b338f7d4-a9fa-45da-9526-60b76271d25c.jpg"),
                          fit: BoxFit.cover,opacity: 50),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 12),
                        child:
                        Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Royal Sea house"),
                                SizedBox(width: 155,),
                                Container(width: 50,
                                  child: Row(
                                    children: [
                                      Expanded(child: SizedBox(),flex: 1,),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.save,color: Colors.white,size:16,)),
                                      Expanded(child: SizedBox(),flex: 1,),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 1,),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                Text("Egypt,Alex")
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.area_chart),
                                Text("150m^2")
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.stairs),
                                Text("4")
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.shower_outlined),
                                SizedBox(width: 0,),
                                Text("4")
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.bed),
                                Text("4"),
                                SizedBox(width: 230,),
                                Container(width: 50,
                                  padding: EdgeInsets.only(left: 2),
                                  decoration: BoxDecoration(
                                      color:Color.fromRGBO(135, 169, 197, 0.6),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(child: SizedBox(),flex: 1,),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.arrow_forward_ios,color: Colors.white,size:16,)),
                                      Expanded(child: SizedBox(),flex: 1,),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                  ),
                ),
              ),



            ],
          ),

        ],
      )
    );
  }
}