import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/widgets/text_fields/rounded_text_field.dart';

import '../../res/colors.dart';

class OptionsDialog extends StatelessWidget {

  /*
    for (int i = 0; i < widget.numbers.length; i++) {
      _controllers[i].text =
      widget.numbers[i] != 1000000000000000000 && widget.numbers[i] != -1
          ? "${widget.numbers[i]}"
          : "";
    }

     */



  var forRentOrSale = -1;

  OptionsDialog(
      {Key? key})
      : super(key: key);

  Widget getTitle(String text) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontSize: 16.sp,
          fontFamily: 'IBMPlexSans',
          fontWeight: FontWeight.w500),
    );
  }

  Widget getChoice(String text, Color color, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border:
        Border.all(width: 2, color: const Color.fromRGBO(14, 82, 137, 1)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'IBMPlexSans',
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: textColor),
        ),
      ),
    );
  }

  var _forRentOrSale = -1;

  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: double.infinity,
        height: 500,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Filters",
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontFamily: "IBMPlexSans",
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                child: getChoice(
                                    "All",
                                    _forRentOrSale == -1
                                        ? primaryColor
                                        : Colors.white,
                                    _forRentOrSale == -1
                                        ? Colors.white
                                        : primaryColor),
                                onTap: () {
                                  /*
                                  setState(() {
                                    _forRentOrSale = -1;
                                  });

                                   */
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                child: getChoice(
                                    "For Sale",
                                    _forRentOrSale == 1
                                        ? primaryColor
                                        : Colors.white,
                                    _forRentOrSale == 1
                                        ? Colors.white
                                        : primaryColor),
                                onTap: () {
                                  /*
                                  setState(() {
                                    _forRentOrSale = 1;
                                  });

                                   */
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                child: getChoice(
                                    "For Rent",
                                    _forRentOrSale == 0
                                        ? primaryColor
                                        : Colors.white,
                                    _forRentOrSale == 0
                                        ? Colors.white
                                        : primaryColor),
                                onTap: () {
                                  /*
                                  setState(() {
                                    _forRentOrSale = 0;
                                  });

                                   */
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        getTitle('Price Range'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                  const Color.fromRGBO(170, 171, 170, 1),
                                  inputType:
                                  const TextInputType.numberWithOptions(),
                                  label: 'Min',
                                  controller: _controllers[0],
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                    cursorColor:
                                    const Color.fromRGBO(170, 171, 170, 1),
                                    inputType: TextInputType.number,
                                    label: 'Max',
                                    controller: _controllers[1])),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        getTitle("Floors Number"),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                  const Color.fromRGBO(170, 171, 170, 1),
                                  inputType: TextInputType.number,
                                  label: 'Min',
                                  controller: _controllers[2],
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                  const Color.fromRGBO(170, 171, 170, 1),
                                  inputType: TextInputType.number,
                                  label: 'Max',
                                  controller: _controllers[3],
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        getTitle("Rooms Number"),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                  const Color.fromRGBO(170, 171, 170, 1),
                                  inputType: TextInputType.number,
                                  label: 'Min',
                                  controller: _controllers[4],
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                  const Color.fromRGBO(170, 171, 170, 1),
                                  inputType: TextInputType.number,
                                  label: 'Max',
                                  controller: _controllers[5],
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        getTitle("Bathrooms"),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                  const Color.fromRGBO(170, 171, 170, 1),
                                  inputType: TextInputType.number,
                                  label: 'Min',
                                  controller: _controllers[6],
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                  const Color.fromRGBO(170, 171, 170, 1),
                                  inputType: TextInputType.number,
                                  label: 'Max',
                                  controller: _controllers[7],
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        getTitle("Area Range"),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                  const Color.fromRGBO(170, 171, 170, 1),
                                  inputType: TextInputType.number,
                                  label: 'Min',
                                  controller: _controllers[8],
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                  const Color.fromRGBO(170, 171, 170, 1),
                                  inputType: TextInputType.number,
                                  label: 'Max',
                                  controller: _controllers[9],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    List<int> list = [];
                    for (var i = 0; i < _controllers.length; i++) {
                      if (_controllers[i].text.isEmpty) {
                        list.add(i % 2 == 0 ? -1 : 1000000000000000000);
                      } else {
                        list.add(int.parse(_controllers[i].text.trim()));
                      }
                    }
                    Navigator.pop(context, false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(14, 82, 137, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Submit'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
