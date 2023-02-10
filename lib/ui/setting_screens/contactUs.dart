import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final problems = ["Problem 1", "Problem 2", "Problem 3"];
  String? value;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal:5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(135, 169, 197, 0.35),
                          borderRadius: BorderRadius.circular(13)
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          size: 18,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 23.h,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text("Get in touch with us",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 25.sp)),
                        ),
                        SizedBox(height: 5.h,),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "We are happy to have contact with us and sorry for the problem that faces you and we will work to solve it",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "IBMPlexSans",
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 23.h,),

                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "What do you want to talk about?",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black54, fontSize: 16.sp
                            ,fontFamily: "IBMPlexSans",
                              fontWeight: FontWeight.w500,),
                          ),
                        ),
                        SizedBox(height: 15.h,),

                        Container(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 3, left: 13, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(216, 216, 216, 0.44)),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.07450980392156863),
                                blurRadius: 35.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(18),
                          ),
                          width: double.infinity,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: value,
                                  icon: const Icon(Icons.arrow_drop_down_rounded,
                                      size: 40, color: Color(0xFF374957)),
                                  hint: Text("Your trouble",style: TextStyle(fontSize: 16.sp,fontFamily: "IBMPlexSans",
                                      fontWeight: FontWeight.w500),),
                                  borderRadius: BorderRadius.circular(20),
                                  items: problems.map(buildMenuItem).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      this.value = value;
                                    });
                                  },
                                ),
                              )),
                        ),
                        SizedBox(height: 23.h,),

                        SizedBox(
                            width: double.infinity,
                            child:Text(
                              "Your Message",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black54, fontSize: 16.sp
                                ,fontFamily: "IBMPlexSans",
                                fontWeight: FontWeight.w500,),
                            ),),
                        SizedBox(height: 15.h,),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(216, 216, 216, 0.44)),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.07450980392156863),
                                blurRadius: 35.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child:  TextField(
                            cursorColor:
                            const Color.fromRGBO(169, 169, 169, 1),
                            maxLines: 6,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(216, 216, 216, 0.9),
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(216, 216, 216, 0.44),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 18.h,),

                        InkWell(
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromRGBO(216, 216, 216, 0.44)),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.07450980392156863),
                                  blurRadius: 35.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text("Attach a Picture",style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "IBMPlexSans",
                                        fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Image(
                                      image: AssetImage("images/attach.png"),
                                      width: 25,
                                    ),
                                  ),
                                ]),
                          ),
                          onTap: (){

                          },
                        ),
                        SizedBox(height: 23.h,),
                        SizedBox(
                          width:double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(14, 82, 137, 1),
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
                  )
                ],
              ),
            ),
          ),
        );
  }
}
