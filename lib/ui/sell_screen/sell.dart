import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/widgets/text_fields/rounded_text_field.dart';

class Sell extends StatelessWidget {
  const Sell({Key? key}) : super(key: key);

  Widget textField(String text, String label, TextInputType inputType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: text.isNotEmpty,
          child: Container(
            padding: EdgeInsets.only(left: 5.w, bottom: 6.h),
            child: Text(
              text,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ),
        RoundedTextField(
          cursorColor: const Color.fromRGBO(14, 82, 137, 1),
          textStyle: TextStyle(fontSize: 18.sp),
          label: label,
          inputType: inputType,
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
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
                    InkWell(
                      child: Container(
                          height: 151.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black38,
                                width: 1,
                              )),
                          child: Center(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                Image(
                                    image: const AssetImage("assets/images/add.png"),
                                    width: 20.w,
                                    height: 20.h),
                                SizedBox(
                                  width:1.w ,
                                ),
                                Text(
                                  "Add Image Or Video",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                      fontFamily: "IBMPlexSans",
                                      fontWeight: FontWeight.w500),
                                )
                              ]))),
                      onTap: (){

                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    textField("Title","",TextInputType.text),
                    SizedBox(
                      height: 15.h,
                    ),
                    textField("Price", "",TextInputType.number),
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
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(14, 82, 137, 1),
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(170, 171, 170, 1),
                              width: 1),
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
                        // Map Here
                        child: const Image(
                            image: AssetImage("assets/images/map.png")
                        )
                    ),
                      SizedBox(height: 15.h,),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: textField("", "Floors", TextInputType.number),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: textField("", "Rooms", TextInputType.number),
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
                          child: Expanded(
                            flex: 1,
                            child: textField("", "Bathrooms", TextInputType.number),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: textField("", "Area", TextInputType.number),
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
