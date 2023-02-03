import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'editProfile.dart';

class Setting extends StatefulWidget{
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
             child: Stack(
               children: [
                 Container(height: 250,
              decoration: BoxDecoration(
                 color: Colors.blue[800],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:  Radius.circular(20))),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 12,bottom: 60),
                     child: Row(
                       children: [
                         Icon(Icons.settings,size: 40,color: Colors.white,),
                         SizedBox(width: 20,),
                         Text("Setting",
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 26,
                           color: Colors.white
                         ),
                         )
                       ],
                     ),
                   ),
                 ),
                Container(height: 530,width: double.infinity,
                  margin: EdgeInsets.only(top: 150,right: 20,left: 20 ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 15),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                             CircleAvatar(
                               radius: 26,
                              backgroundImage:
                              AssetImage("img/SUIIIIIIIIIIII.jpg")
                              
                             ),
                            SizedBox(width: 15,),
                            Text("Cristiano Ronaldo",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.normal
                            ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("----------------------------------------")
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Account Settigs",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Text("Edit Profile",
                                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
                                ),
                                SizedBox(width: 150,),
                                IconButton(onPressed: (){
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context)=>edit()));
                                }, icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Text("Change Password",
                                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
                                ),
                                SizedBox(width: 85,),
                                IconButton(onPressed: (){
                                 Container(
                                    child: AlertDialog(
                                      title: Text("Change Password"),
                                      actions: [
                                        ElevatedButton(onPressed: (){}, child: Text("fbge"))
                                      ],
                                    ),
                                  );
                                }, icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Text("Dark Mode",
                                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
                                ),
                                SizedBox(width: 150,),
                                IconButton(onPressed: (){}, icon: Icon(Icons.dark_mode_outlined))
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Text("More",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Text("Contact us",
                                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
                                ),
                                SizedBox(width: 150,),
                                IconButton(onPressed: (){

                                }, icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Text("Log out",
                                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
                                ),
                                SizedBox(width: 180,),
                                IconButton(onPressed: (){}, icon: Icon(Icons.logout))
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Text("Delete Account",
                                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
                                ),
                                SizedBox(width: 110,),
                                IconButton(onPressed: (){
                                CupertinoAlertDialog(
                                  title: Text("Delete account"),
                                  content: Text("Do you accept"),
                                  actions: [
                                    CupertinoDialogAction(child: Text("No")),
                                    CupertinoDialogAction(child: Text("Yes")),
                                  ],
                                );
                                }, icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
               ],
             ),
          ),
        ),

    );
  }
}