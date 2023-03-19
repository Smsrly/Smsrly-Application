import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smsrly/ui/authentication_screens/sign_up.dart';
import 'package:smsrly/ui/authentication_screens/splash_screen.dart';

class Verify extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(width: double.infinity,
          color: Color(0xE1D9D1),

          padding: EdgeInsets.only(top: 50,left: 15,right: 15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_)
                        {
                          return SignUp();
                        }),);
                  }, icon: Icon(Icons.arrow_back_ios,size: 35,)),

                ],
              ),
              SizedBox(height: 25,),
              Container(padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text("Verify your email",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              SizedBox(height: 65),
              Image.asset("assets/images/verift.png",),
              SizedBox(height: 40,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 68,
                    width: 64,
                    child:
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child:
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },

                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child:
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },

                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child:
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },

                    ),
                  ),
                ],
              ),
              SizedBox(height: 88,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_)
                      {
                        return SplashScreen();
                      }),);
                    },
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14))),
                        backgroundColor:
                        const MaterialStatePropertyAll(Color.fromRGBO(14, 82, 137, 1)),
                        fixedSize: const MaterialStatePropertyAll(Size(328, 49))),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}
