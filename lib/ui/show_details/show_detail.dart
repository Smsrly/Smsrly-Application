import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/models/realestate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/location.dart';
void main(){
 var oo=RealEstate(
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
     Location(21321.3, 1231.2),
     "Egypt",
     "Cairo",0);

  runApp(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return
            MaterialApp(
              debugShowCheckedModeBanner: false,
              home:ShowDetail(item: oo,),
            );
        },

      )
  );
}

class ShowDetail extends StatelessWidget {
  late RealEstate item;
  ShowDetail({Key? key,required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 440.h,
                        child:

                           Image.network(item.imageUrl,fit: BoxFit.cover,
                             frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {return child;},
                             loadingBuilder:(context, child, loadingProgress) {
                               if(loadingProgress==null){
                                 return  child;
                               }else{
                                 return  Column(mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     SizedBox(
                                       child: CircularProgressIndicator(),
                                       height: 70.0.h,
                                       width: 80.0.w,
                                     ),
                                   ],
                                 );
                               }
                             },
                           )
                    ),
                  ],
                ),
                Column(
                  children: [
                    //320.h
                      SizedBox(height: height/2.1,),

                    Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      decoration:  const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight:Radius.circular(32) ,topLeft: Radius.circular(32)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title,style:   TextStyle(
                            fontSize: 20.sp, fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),
                          ),
                            SizedBox(height: 20.h),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width:20.w,
                                      height: 20.h,
                                      child: Image.asset("images/bed_icon.png"),
                                  ),
                                    SizedBox(width: 3.w),
                                  Text("${item.roomsNo}",style:   TextStyle(color: Color.fromRGBO(170, 169, 169, 1)
                                  ,fontSize: 15.sp,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:20.w,
                                    height: 20.h,
                                    child: Image.asset("images/bathtub_icon.png"),
                                  ),
                                  const SizedBox(width: 3),
                                  Text("${item.bathroomsNo}",style: const TextStyle(color: Color.fromRGBO(170, 169, 169, 1)
                                      ,fontSize: 15,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:20,
                                    height: 20,
                                    child: Image.asset("images/stairs_icon.png"),
                                  ),
                                    SizedBox(width: 3.w),
                                  Text("${item.floor}",style:   TextStyle(color: Color.fromRGBO(170, 169, 169, 1)
                                      ,fontSize: 15.sp,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:20.w,
                                    height: 20.h,
                                    child: Image.asset("images/areaa_icon.png"),
                                  ),
                                    SizedBox(width: 3.w),
                                  Text("${item.area}m²",style:   TextStyle(color: Color.fromRGBO(170, 169, 169, 1)
                                      ,fontSize: 15.sp,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),),
                                ],
                              ),

                            ],
                          ),
                            SizedBox(height: 20.h),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.17),
                                  blurRadius: 50.0,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(item.owner!= null?item.owner?.pictureUrl as String:"https://user-images.githubusercontent.com/90563044/215369020-31ed45db-baa0-4175-a7ae-c31629fa7fdb.png"),

                                        ),
                                          SizedBox(width: 5.w,),
                                        Text(item.owner!=null?item.owner?.username as String:"Not Found",style: const TextStyle(fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),)
                                      ],
                                    ),
                                    Visibility(
                                      visible: item.owner != null,
                                      child: InkWell(
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          width: 40.w,
                                          height: 40.h,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(14, 82, 137, 0.18),
                                              borderRadius: BorderRadius.circular(13)
                                          ),
                                          child: Image.asset("images/call_icon.png"),

                                        ),
                                        onTap: (){
                                          launch("tel://${item.owner?.phoneNumber}");
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                  SizedBox(height: 2.h),
                                Text(item.description,style: const TextStyle(fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400,),)
                              ],
                            ),
                          ),
                            SizedBox(height: 25.h),
                          Container(margin: const EdgeInsets.symmetric(horizontal: 10), width: double.infinity,child: Image.network("https://user-images.githubusercontent.com/90563044/215372638-0dca96fa-5e19-4aea-a8cd-57c9eb9c225b.png")),
                            SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Latitude: ${item.location.late}",style: const TextStyle(fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400,),),
                              Text("Longitude: ${item.location.long}",style: const TextStyle(fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400,),),
                            ],
                          ),
                            SizedBox(height: 35.h),
                          Row(
                            children: [
                              Expanded(flex: 1,child: Text("${item.price} EGP",textAlign: TextAlign.center,style: const TextStyle(fontSize: 18,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w500)),),
                              Expanded(flex: 1,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // will add it later
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(14, 82, 137, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                                      child: Text('Request'),
                                    ),
                                  ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // will change it later
                  ],
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.15),
                        borderRadius: BorderRadius.circular(13)
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
