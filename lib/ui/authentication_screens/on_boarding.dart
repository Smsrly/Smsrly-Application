import 'package:flutter/material.dart';
import 'package:smsrly/ui/authentication_screens/login.dart';

class OnBoarding extends StatelessWidget{
  const OnBoarding({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
          Stack(
            children: [
              Container(
                height: double.infinity,
                width:double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://user-images.githubusercontent.com/108674357/215354307-5c8a0a80-64b4-4705-a44a-738c6585573a.png")
                    ,fit: BoxFit.cover),
                ),
              ),
              Container(
                height: double.infinity,
                width:double.infinity,
                color: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(flex:1,child: SizedBox()),
                    SizedBox(
                        width: 400,
                        height: 400,
                        child: Image.asset("images/onboarding_logo.png")
                    ),
                    const Expanded(flex:1,child: SizedBox()),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_){
                                return const Login();
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
                          child: Text('Get Started'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,)

                  ],
                ),
              )
            ],
          )
    );
  }
}