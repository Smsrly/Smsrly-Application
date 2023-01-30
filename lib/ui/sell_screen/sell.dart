import 'package:flutter/material.dart';


class Sell extends StatefulWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Padding(
              padding: const EdgeInsets.only(top: 14),
              child: ListView(
                children: [
                  Column(
                    children: [
                      const Center(
                          child: Text(
                        "Samsrly",
                        style: TextStyle(fontFamily: "Inter", fontSize: 22),
                      )),
                      Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                              height: 151,
                              width: 328,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.black38, width: 1)),
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                    Padding(
                                      padding: EdgeInsets.only(right: 3),
                                      child: Image(
                                          image: AssetImage("images/add.png"),
                                          width: 16,
                                          height: 16),
                                    ),
                                    Text(
                                      "Add Images & Video",
                                      style: TextStyle(
                                          fontFamily: "IBMPlexSans",
                                          fontWeight: FontWeight.w500),
                                    )
                                  ])))),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 28),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Title",
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 3),
                        child: TextField(
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 28),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Price",
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 3),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 28),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Description",
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 3),
                        child: TextField(
                          maxLines: 8,
                          style: const TextStyle(
                              fontSize: 18, overflow: TextOverflow.clip),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 28),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Location",
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 3),
                        child: Container(
                            height: 150,
                            width: 323.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black38, width: 1)),
                            child: const Image(
                                image: AssetImage("images/map.png"))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                height: 56,
                                width: 160,
                                child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        label: const Text("Floor"),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ))),
                              ),
                            ),
                            SizedBox(
                              height: 56,
                              width: 160,
                              child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      label: const Text("Rooms"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SizedBox(
                              height: 56,
                              width: 160,
                              child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      label: const Text("Bathroom"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                            ),
                          ),
                          SizedBox(
                            height: 56,
                            width: 160,
                            child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    label: const Text("Area"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ))),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Submit"),
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14))),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF0E5289)),
                          fixedSize: MaterialStatePropertyAll(Size(328, 49))),
                    ),
                  )
                ],
              )),
        ));
  }
}
