import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordFieldNotVisible = true;
  bool _isConfirmPasswordFieldNotVisible = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'IBMPlexSans',
                              fontWeight: FontWeight.w700)
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                                    AssetImage("images/profile_icon.png"),
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
                                    child: Image.asset("images/camera_icon.png")
                                )
                              ],
                            ),
                          )
                        ]
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(
                          fontSize: 18,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w500, color: Color.fromRGBO(124, 124, 124, 1)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(14, 82, 137, 1),
                          width: 2,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(170, 171, 170, 1),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),


                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(
                          fontSize: 18, fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w500,color: Color.fromRGBO(124, 124, 124, 1)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(14, 82, 137, 1),
                          width: 2,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(170, 171, 170, 1),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(
                    height: 25,
                  ),


                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontSize: 18, fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w500,color: Color.fromRGBO(124, 124, 124, 1)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(14, 82, 137, 1),
                          width: 2,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(170, 171, 170, 1),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),


                  TextFormField(
                    obscureText: _isPasswordFieldNotVisible,
                    keyboardType: TextInputType.visiblePassword,
                    decoration:  InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          _isPasswordFieldNotVisible=!_isPasswordFieldNotVisible;
                        });
                      }, icon: Icon(_isPasswordFieldNotVisible?Icons.visibility_off:Icons.visibility)),
                      labelStyle: const TextStyle(
                          fontSize: 18, fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w500,color: Color.fromRGBO(124, 124, 124, 1)),
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


                  const SizedBox(
                    height: 25,
                  ),


                  TextFormField(
                    obscureText: _isConfirmPasswordFieldNotVisible,
                    keyboardType: TextInputType.visiblePassword,
                    decoration:  InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          _isConfirmPasswordFieldNotVisible=!_isConfirmPasswordFieldNotVisible;
                        });
                      }, icon: Icon(_isConfirmPasswordFieldNotVisible?Icons.visibility_off:Icons.visibility)),
                      labelStyle: const TextStyle(
                          fontSize: 18, fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w500,color: Color.fromRGBO(124, 124, 124, 1)),
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

                  const SizedBox(
                    height: 30,
                  ),

                  
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(14, 82, 137, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('Sign Up'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account ?"),
                      TextButton(onPressed: () {}, child: const Text("Log In"))
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
