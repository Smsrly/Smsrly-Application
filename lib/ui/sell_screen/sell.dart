import 'package:flutter/material.dart';


class Sell extends StatelessWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 14,left: 14,right: 14),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                            child: Text(
                          "Smsrly",
                          style: TextStyle(fontFamily: "Inter", fontSize: 22),
                        )),
                        const SizedBox(height: 15,),
                        Container(
                            height: 151,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.black38, width: 1)),
                            child: Center(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: const [
                                  Image(
                                      image: AssetImage("images/add.png"),
                                      width: 16,
                                      height: 16),
                                  Text(
                                    "Add Images & Video",
                                    style: TextStyle(
                                        fontFamily: "IBMPlexSans",
                                        fontWeight: FontWeight.w500),
                                  )
                                ]))),
                        const SizedBox(height: 15,),
                        Container(
                          padding: const EdgeInsets.only(left: 5,bottom: 6),
                          child: const Text(
                            "Title",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        TextField(
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              borderSide: const BorderSide(
                                color:Color.fromRGBO(14, 82, 137, 1),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              borderSide: const BorderSide(
                                color:Color.fromRGBO(170, 171, 170,1),
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          padding: const EdgeInsets.only(left: 5,bottom: 6),
                          child: const Text(
                            "Price",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 18),
                          cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              borderSide: const BorderSide(
                                color:Color.fromRGBO(14, 82, 137, 1),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              borderSide: const BorderSide(
                                color:Color.fromRGBO(170, 171, 170,1),
                                width: 1.5,
                              ),
                            ),
                             ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          padding: const EdgeInsets.only(left: 5,bottom: 6),
                          child: const Text(
                            "Description",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        TextField(
                          maxLines: 8,
                          style: const TextStyle(
                              fontSize: 18, overflow: TextOverflow.clip),
                            cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: const BorderSide(
                                  color:Color.fromRGBO(14, 82, 137, 1),
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: const BorderSide(
                                  color:Color.fromRGBO(170, 171, 170,1),
                                  width: 1.5,
                                ),
                              ),
                            ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          padding: const EdgeInsets.only(left: 5,bottom: 6),
                          child: const Text(
                            "Location",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),

                        // ignore: prefer_const_constructors
                        SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: const Image(
                                image: AssetImage("images/map.png"))),
                        const SizedBox(height: 15,),

                        Row(
                          children: [

                             Expanded(
                              flex: 1,
                              child: TextField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                                  decoration: InputDecoration(
                                    labelText: "Floors",
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      borderSide: const BorderSide(
                                        color:Color.fromRGBO(14, 82, 137, 1),
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      borderSide: const BorderSide(
                                        color:Color.fromRGBO(170, 171, 170,1),
                                        width: 1.5,
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(width: 10,),

                            Expanded(
                              flex: 1,
                              child: TextField(
                                  keyboardType: TextInputType.number,
                                cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                                decoration: InputDecoration(
                                  labelText: "Rooms",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(14, 82, 137, 1),
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(170, 171, 170,1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),),
                            ),

                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [

                            Expanded(
                              flex: 1,
                              child: TextField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                                  decoration: InputDecoration(
                                    labelText: "Rooms",
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      borderSide: const BorderSide(
                                        color:Color.fromRGBO(14, 82, 137, 1),
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      borderSide: const BorderSide(
                                        color:Color.fromRGBO(170, 171, 170,1),
                                        width: 1.5,
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(width: 10,),

                            Expanded(
                              flex: 1,
                              child: TextField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: const Color.fromRGBO(14, 82, 137, 1),
                                  decoration: InputDecoration(
                                    labelText: "Area",
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      borderSide: const BorderSide(
                                        color:Color.fromRGBO(14, 82, 137, 1),
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      borderSide: const BorderSide(
                                        color:Color.fromRGBO(170, 171, 170,1),
                                        width: 1.5,
                                      ),
                                    ),
                                  )),
                            ),

                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),

                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14))),
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xFF0E5289)),
                          fixedSize: const MaterialStatePropertyAll(Size(328, 49))),
                      child: const Text("Submit"),
                    ),
                    const SizedBox(height: 10,),
                  ],
                )),
          ),
        );
  }
}
