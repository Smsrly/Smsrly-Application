import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/authentication_screens/sign_up.dart';
import 'package:smsrly/ui/authentication_screens/splash_screen.dart';
import 'package:smsrly/ui/widgets/text_fields/text_field_with_bottom_border.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _isNotVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 350.h,
                  child: Image.asset("assets/images/picture_for_login.png"),
                ),
                Row(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 32.sp,
                          fontFamily: 'IBMPlexSans',
                          fontWeight: FontWeight.w700),
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFieldWithBottomBorder(label: 'Email',inputType: TextInputType.emailAddress,fontSize: 18.sp),
                SizedBox(
                  height: 15.h,
                ),
                TextFormField(
                  obscureText: _isNotVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration:  InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        _isNotVisible=!_isNotVisible;
                      });
                    }, icon: Icon(_isNotVisible?Icons.visibility_off:Icons.visibility)),
                    labelStyle: TextStyle(
                        fontSize: 18.sp, color: const Color.fromRGBO(124, 124, 124, 1)),
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
                  height: 28.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_){
                            return  SplashScreen();
                          })
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(14, 82, 137, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text('Login'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?",style: TextStyle(fontSize: 18.sp,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400)),
                    TextButton(onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_){
                            return const SignUp();
                          })
                      );
                    }, child: Text('Sign Up',style: TextStyle(fontSize: 18.sp,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400)))
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
