import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'editProfile.dart';

void main(){
  runApp(  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:Setting(),
        );
      }

  ));
}
class Setting extends StatefulWidget{

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(height: 250.h,
           decoration: BoxDecoration(
              color: Colors.blue[800],
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.w),bottomRight:  Radius.circular(20.w))),
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.w,bottom: 55.w),
                  child: Row(
                    children: [
                      Icon(Icons.settings,size: 40.sp,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Text("Setting",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.sp,
                        color: Colors.white
                      ),
                      )
                    ],
                  ),
                ),
              ),
             Container(height: 500.h,width: double.infinity,
               margin: EdgeInsets.only(top: h/5,right: 20.w,left: 20.w ),
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.all(Radius.circular(20.h))
               ),
               child: Padding(
                 padding: EdgeInsets.only(top: 12.h,left: 10.w),
                 child:
                 Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                          CircleAvatar(
                            radius: 26,
                           backgroundImage:
                           AssetImage("images/SUIIIIIIIIIIII.jpg")

                          ),
                         SizedBox(width: 15.h,),
                         Text("Cristiano Ronaldo",
                         style: TextStyle(
                           fontSize: 22.sp,
                           fontWeight: FontWeight.normal
                         ),
                         )
                       ],
                     ),
                     SizedBox(height: 10.h,),
                     Row(
                       children: [
                         Text("---------------------------------------------")
                       ],
                     ),
                     Column(
                       children: [
                         Row(
                           children: [
                             Text("Account Settings",
                               style: TextStyle(color: Color(0xFFADADAD),fontWeight: FontWeight.w300,fontSize: 20.sp),),
                           ],
                         ),
                         SizedBox(height: 15.h,),
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Edit Profile",
                               style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20.sp),
                             ),

                             IconButton(onPressed: (){
                               Navigator.of(context)
                                   .push(MaterialPageRoute(builder: (context)=>edit()));
                             }, icon: Icon(Icons.arrow_forward_ios))
                           ],
                         ),
                         SizedBox(height: 13.h,),
                         Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Change Password",
                               style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
                             ),

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
                         SizedBox(height: 13.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Dark Mode",
                               style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
                             ),

                             IconButton(onPressed: (){}, icon: Icon(Icons.dark_mode_outlined))
                           ],
                         ),
                         SizedBox(height: 13.h,),
                         Row(
                           children: [
                             Text("More",
                               style: TextStyle(color: Color(0xFFADADAD),fontWeight: FontWeight.w300,fontSize: 20),),
                           ],
                         ),
                         SizedBox(height: 13.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Contact us",
                               style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
                             ),
                             IconButton(onPressed: (){

                             }, icon: Icon(Icons.arrow_forward_ios))
                           ],
                         ),
                         SizedBox(height: 13.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Log out",
                               style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
                             ),
                             IconButton(onPressed: (){}, icon: Icon(Icons.logout))
                           ],
                         ),
                         SizedBox(height: 13.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Delete Account",
                               style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),
                             ),
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

    );
  }
}