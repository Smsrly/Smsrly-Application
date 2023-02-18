import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/authentication_screens/login.dart';
import 'package:smsrly/ui/authentication_screens/splash_screen.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/ui/widgets/text_fields/text_field_with_bottom_border.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool _isPasswordFieldNotVisible = true;
  bool _isConfirmPasswordFieldNotVisible = true;
  final _countryPicker =const FlCountryCodePicker();
  CountryCode? _countryCode;
  Widget? _flag=Image.asset("assets/images/egypt_flag.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h,),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 32.sp,
                              fontFamily: 'IBMPlexSans',
                              fontWeight: FontWeight.w700)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: InkWell(
                      child: Center(
                        child: Stack(alignment: Alignment.center, children:  [
                          const SizedBox(
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/profile_icon.png"),
                              )),
                          SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                    width:50,
                                    height: 50,
                                    child: Image.asset("assets/images/camera_icon.png")
                                )
                              ],
                            ),
                          )
                        ]
                        ),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),

                  TextFieldWithBottomBorder(label: "First Name",inputType: TextInputType.name,fontSize: 18.sp,),

                  SizedBox(
                    height: 25.h,
                  ),


                  TextFieldWithBottomBorder(label: "Second Name",inputType: TextInputType.name,fontSize: 18.sp),


                  SizedBox(
                    height: 25.h,
                  ),


                  TextFieldWithBottomBorder(label: "Email",inputType: TextInputType.emailAddress,fontSize: 18.sp),

                  SizedBox(
                    height: 25.h,
                  ),
                  TextFieldWithBottomBorder(
                    label: "Phone Number",
                    inputType: TextInputType.number,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    fontSize: 18.sp,
                    prefixIcon:  Container(
                    width: 80,

                    padding: const EdgeInsets.all(3),
                    margin: const EdgeInsets.all(3),


                    child: InkWell(
                      onTap: ()async{
                        var code= await _countryPicker.showPicker(context: context);
                        setState(() {
                          if(code!=null){
                            _countryCode=code;
                            _flag=_countryCode?.flagImage;
                          }
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            child: _countryCode!= null ? _countryCode?.flagImage:_flag,
                          ),
                          const SizedBox(width: 3,),
                          Text(_countryCode == null ? "+20" : "${_countryCode?.dialCode}",style: const TextStyle(fontSize: 15,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400,color: Color.fromRGBO(124, 124, 124, 1)),)
                        ],
                      ),
                    ),
                  ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),


                  TextFormField(
                    obscureText: _isPasswordFieldNotVisible,
                    cursorColor: const Color.fromRGBO(124, 124, 124, 1),
                    keyboardType: TextInputType.visiblePassword,
                    decoration:  InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          _isPasswordFieldNotVisible=!_isPasswordFieldNotVisible;
                        });
                      }, icon: Icon(_isPasswordFieldNotVisible?Icons.visibility_off:Icons.visibility)),
                      labelStyle: TextStyle(
                          fontSize: 18.sp,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w500, color: const Color.fromRGBO(124, 124, 124, 1)),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(14, 82, 137, 1),
                          width: 2,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(170, 171, 170, 1),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 25.h,
                  ),


                  TextFormField(
                    obscureText: _isConfirmPasswordFieldNotVisible,
                    cursorColor: const Color.fromRGBO(124, 124, 124, 1),
                    keyboardType: TextInputType.visiblePassword,
                    decoration:  InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          _isConfirmPasswordFieldNotVisible=!_isConfirmPasswordFieldNotVisible;
                        });
                      }, icon: Icon(_isConfirmPasswordFieldNotVisible?Icons.visibility_off:Icons.visibility)),
                      labelStyle: TextStyle(
                          fontSize: 18.sp,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w500, color: const Color.fromRGBO(124, 124, 124, 1)),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(14, 82, 137, 1),
                          width: 2,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(170, 171, 170, 1),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30.h,
                  ),

                  
                  SizedBox(
                    width: double.infinity,
                    child: RoundedButton(
                      onClick: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_){
                              return  SplashScreen();
                            })
                        );
                      },

                      text: 'Sign Up',

                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ?",style: TextStyle(fontSize: 18.sp,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),),
                      TextButton(onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_){
                              return const Login();
                            })
                        );
                      }, child: Text("Log In",style: TextStyle(fontSize: 18.sp,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400)))
                    ],
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}
