import 'package:flutter/material.dart';
import 'package:smsrly/ui/setting_screens/setting.dart';

class edit extends StatefulWidget {
  bool isVisible = true;
  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:  Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(top: 45, left: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 50,
                      padding: EdgeInsets.only(left: 2),
                      decoration: BoxDecoration(
                          color:Color.fromRGBO(135, 169, 197, 0.6),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: [
                          Expanded(child: SizedBox(),flex: 1,),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => Setting()));
                              },
                              icon: Icon(Icons.arrow_back_ios,color: Colors.white,size:16,)),
                          Expanded(child: SizedBox(),flex: 1,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 110, left: 15, right: 15),
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Basic Information",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "First Name",
                          border: new OutlineInputBorder(
                              borderSide: BorderSide(width: 5),
                              borderRadius: BorderRadius.circular(20.0)),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          border: new OutlineInputBorder(
                              borderSide: BorderSide(width: 5),
                              borderRadius: BorderRadius.circular(20.0)),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: new OutlineInputBorder(
                              borderSide: BorderSide(width: 5),
                              borderRadius: BorderRadius.circular(20.0)),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Phone number",
                          border: new OutlineInputBorder(
                              borderSide: BorderSide(width: 5),
                              borderRadius: BorderRadius.circular(20.0)),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Location"),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 15),
                      child: Container(alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(height: 40,),
                            ElevatedButton(onPressed: (){}, child:
                            Text("Submit"))
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 70),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                 backgroundImage: AssetImage("img/index.jpg"),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
