import 'package:flutter/material.dart';
import 'package:smsrly/ui/authentication_screens/sign_up.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: Image.asset("images/picture_for_login.png"),
                ),
                Row(
                  children: const [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'IBMPlexSans',
                          fontWeight: FontWeight.w700),
                    ),
                    Expanded(flex: 1, child: SizedBox())
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(124, 124, 124, 1)),
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
                  height: 15,
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
                    labelStyle: const TextStyle(
                        fontSize: 18, color: Color.fromRGBO(124, 124, 124, 1)),
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
                  height: 28,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
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
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account ?"),
                    TextButton(onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_){
                            return const SignUp();
                          })
                      );
                    }, child: const Text('Sign Up'))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
