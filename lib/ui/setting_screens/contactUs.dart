import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final problems = ["Problem 1", "Problem 2", "Problem 3"];
  String? value;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 50, bottom: 8),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromRGBO(135, 169, 197, 0.35),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child:
                          const Icon(Icons.arrow_back, color: Colors.black45),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 18, top: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text("Get in touch with us",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontStyle: FontStyle.normal,
                            fontSize: 25)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "We are happy to have contact with us and sorry for the problem that faces you and we will work to solve it",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25, left: 22),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "What do you want to talk about?",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 1,
                              offset: Offset(0, 3),
                              color: Colors.black12)
                        ]),
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            value: value,
                            icon: const Icon(Icons.arrow_drop_down_rounded,
                                size: 40, color: Color(0xFF374957)),
                            hint: const Text("Your trouble"),
                            borderRadius: BorderRadius.circular(20),
                            items: problems.map(buildMenuItem).toList(),
                            onChanged: (value) {
                              setState(() {
                                this.value = value;
                              });
                            },
                          ),
                        )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 12),
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Your Message",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Material(
                    shadowColor: Colors.black54,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: const TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, top: 30),
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 1,
                              offset: Offset(0, 3),
                              color: Colors.black12)
                        ],
                        borderRadius: BorderRadius.circular(14)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text("Attach a Picture"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Image(
                              image: AssetImage("images/attach.png"),
                              width: 25,
                            ),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: SizedBox(
                    height: 60,
                    width: 320,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)))),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xFF0E5289))),
                        child: const Text(
                          "Send",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
