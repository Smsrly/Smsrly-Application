import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (BuildContext context, Widget? child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Sell(),
      );
    },
  ));
}

class Sell extends StatelessWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(top: 14.h, left: 14.w, right: 14.w),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      "Smsrly",
                      style: TextStyle(fontFamily: "Inter", fontSize: 22.sp),
                    )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                        height: 151.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black38,
                              width: 1.w,
                            )),
                        child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Image(
                                  image: AssetImage("images/add.png"),
                                  width: 16.w,
                                  height: 16.h),
                              Text(
                                "Add Images & Video",
                                style: TextStyle(
                                    fontFamily: "IBMPlexSans",
                                    fontWeight: FontWeight.w500),
                              )
                            ]))),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.w, bottom: 6.h),
                      child: Text(
                        "Title",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    TextField(
                      style: TextStyle(fontSize: 18.sp),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(14, 82, 137, 1),
                              width: 1.w),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(170, 171, 170, 1),
                              width: 1.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.w, bottom: 6.w),
                      child: Text(
                        "Price",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 18.sp),
                      cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.w),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(14, 82, 137, 1),
                              width: w / 300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(170, 171, 170, 1),
                              width: 1.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.w, bottom: 6.w),
                      child: Text(
                        "Description",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    TextField(
                      maxLines: 8,
                      style: TextStyle(
                          fontSize: 18.sp, overflow: TextOverflow.clip),
                      cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(14, 82, 137, 1),
                            width: 2.w,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(170, 171, 170, 1),
                              width: 1.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.w, bottom: 6.w),
                      child: Text(
                        "Location",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),

                    // ignore: prefer_const_constructors

                    SizedBox(
                        height: 150.h,
                        width: double.infinity,
                        child: const Image(
                            image: AssetImage("images/map.png"))),
                      SizedBox(height: 15.h,),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                              keyboardType: TextInputType.number,
                              cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                              decoration: InputDecoration(
                                labelText: "Floors",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(14, 82, 137, 1),
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(170, 171, 170, 1),
                                      width: 1.w),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                            decoration: InputDecoration(
                              labelText: "Rooms",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(14, 82, 137, 1),
                                  width: 2.w,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(170, 171, 170, 1),
                                    width: 1.w),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                              keyboardType: TextInputType.number,
                              cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                              decoration: InputDecoration(
                                labelText: "Rooms",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(14, 82, 137, 1),
                                    width: 2.w,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(170, 171, 170, 1),
                                      width: 1.w),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                              keyboardType: TextInputType.number,
                              cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                              decoration: InputDecoration(
                                labelText: "Area",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(14, 82, 137, 1),
                                    width: 2.w,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(170, 171, 170, 1),
                                      width: 1.w),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFF0E5289)),
                      fixedSize: const MaterialStatePropertyAll(Size(328, 49))),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            )),
      ),
    );
  }
}
