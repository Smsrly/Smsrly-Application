import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  bool isVisible = true;
  bool vv = true;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("img/login img.png",height: 320,),

              Row(
                children: [
                  SizedBox(width: 25,),
                  Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                ],
              ),
              SizedBox(height: 22,),
              Row(
                children: [
                  SizedBox(width:25,),
                  Text("Email",style:TextStyle(color: Color(0xFF7C7C7C)),)
                ],
              ),
              Column(
                children: [
                  SizedBox(width: 25,),
                  Container(margin: EdgeInsets.only(left: 25,right: 15),
                    child:
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration()
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 25,),
                  Text("Password",style: TextStyle(color: Color(0xFF7C7C7C)),)
                ],
              ),
              Column(
                children: [
                  Container(margin: EdgeInsets.only(left: 25,right: 15),
                    child:
                    TextField(
                        obscureText: widget.isVisible,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: (){
                            setState(
                                    (){
                               
                                  if(widget.isVisible==true){
                                    widget.isVisible=false;
                                  }else{
                                    widget.isVisible=true;
                                  }
                                }
                            );
                          }, icon:widget.isVisible==true?Icon(Icons.visibility):Icon(Icons.visibility_off)),
                        )
                    ),
                  ),
                  SizedBox(height: 15,),
                 // Column(
                 //   children: [
                 //     Padding(
                 //       padding: EdgeInsets.only(left: 20.0,right: 15),
                 //       child: SizedBox(
                 //         width: 300,
                 //         height: 56,
                 //         child:
                 //         RaisedButton(
                 //           onPressed: () {},
                 //           child: Text("Login"),
                 //           textColor: Colors.white,
                 //           color: Color(0xFF0E5289),
                 //           shape: new RoundedRectangleBorder(
                 //             borderRadius: new BorderRadius.circular(15.0),
                 //           ),
                 //         ),
                 //       ),
                 //     )
                 //   ],
                 // ),
                  SizedBox(height: 0,),
                  Row(
                    children: [
                      SizedBox(width: 78,),
                      Text("Don't have an account?"),
                      TextButton(onPressed: (){}, child: Text("Sign up",style: TextStyle(color: Colors.blue),))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
// ButtonStyle(
//   shape: MaterialStateProperty.all(
//     RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(25)
//     )
//   ),
// ),
// ElevatedButton(
//   style:ElevatedButton.styleFrom(
//     minimumSize: Size(320, 56),
//  ),
//     onPressed: (){},
//     child: Text("Login"))