import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Edit extends StatelessWidget {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 350.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.sp),
                          bottomRight: Radius.circular(30.sp))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          width: 45,
                          height: 45.h,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(135, 169, 197, 0.6),
                              borderRadius: BorderRadius.circular(13)),
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
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 110.h, left: 15.w, right: 15.w),
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          right: 15, left: 15, top: 40, bottom: 15),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.15),
                              blurRadius: 50.0,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Basic Information",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "First Name",
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 5),
                                    borderRadius: BorderRadius.circular(20.0)),
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Last Name",
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 5),
                                    borderRadius: BorderRadius.circular(20.0)),
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 5),
                                    borderRadius: BorderRadius.circular(20.0)),
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: "Phone number",
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 5),
                                    borderRadius: BorderRadius.circular(20.0)),
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Image.asset(
                            "images/location.jpg",
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromRGBO(14, 82, 137, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text('Submit'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 70.h),
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("images/SUIIIIIIIIIIII.jpg"),
                      )
                    ],
                  ),
                ),
              ],
            ),
        ),
    ));
  }
}
