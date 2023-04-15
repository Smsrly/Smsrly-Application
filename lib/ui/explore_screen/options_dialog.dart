import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/ui/widgets/text_fields/rounded_text_field.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/explore_viewmodel.dart';

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

  OptionsDialog({Key? key}) : super(key: key);

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
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border:
            Border.all(width: 2, color: primaryColor),
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
    final exploreViewModel =
        Provider.of<ExploreViewModel>(context, listen: false);
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].text = exploreViewModel.getRequirement(i);
    }
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
                          StringManager.filters,
                          style: AppStyles.headline5,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  10.he,
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
                              child: Consumer<ExploreViewModel>(
                                builder: (_, viewModel, __) {
                                  return InkWell(
                                      child: getChoice(
                                          StringManager.all,
                                          viewModel.rentOrSale == -1
                                              ? primaryColor
                                              : Colors.white,
                                          viewModel.rentOrSale == -1
                                              ? Colors.white
                                              : primaryColor),
                                      onTap: () {
                                        viewModel.rentOrSale = -1;
                                      });
                                },
                              ),
                            ),
                            8.he,
                            Expanded(
                                flex: 1,
                                child: Consumer<ExploreViewModel>(
                                  builder: (_, viewModel, __) {
                                    return InkWell(
                                      child: getChoice(
                                          StringManager.forSale,
                                          viewModel.rentOrSale == 0
                                              ? primaryColor
                                              : Colors.white,
                                          viewModel.rentOrSale == 0
                                              ? Colors.white
                                              : primaryColor),
                                      onTap: () {
                                        viewModel.rentOrSale = 0;
                                      },
                                    );
                                  },
                                )),
                            8.he,
                            Expanded(
                                flex: 1,
                                child: Consumer<ExploreViewModel>(
                                  builder: (_, viewModel, __) {
                                    return InkWell(
                                      child: getChoice(
                                          StringManager.forRent,
                                          viewModel.rentOrSale == 1
                                              ? primaryColor
                                              : Colors.white,
                                          viewModel.rentOrSale == 1
                                              ? Colors.white
                                              : primaryColor),
                                      onTap: () {
                                        viewModel.rentOrSale = 1;
                                      },
                                    );
                                  },
                                ))
                          ],
                        ),
                        15.he,
                        getTitle(StringManager.priceRange),
                        10.he,
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                  filterTextFieldCursorColor ,
                                  inputType:
                                      const TextInputType.numberWithOptions(),
                                  label: 'Min',
                                  controller: _controllers[0],
                                )),
                            10.wi,
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                    cursorColor:
                                      filterTextFieldCursorColor,
                                    inputType: TextInputType.number,
                                    label: 'Max',
                                    controller: _controllers[1])),
                          ],
                        ),
                        15.he,
                        getTitle("Floors Number"),
                        10.he,
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                    filterTextFieldCursorColor,
                                  inputType: TextInputType.number,
                                  label: 'Min',
                                  controller: _controllers[2],
                                )),
                            10.wi,
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                    filterTextFieldCursorColor,
                                  inputType: TextInputType.number,
                                  label: 'Max',
                                  controller: _controllers[3],
                                )),
                          ],
                        ),
                        15.he,
                        getTitle("Rooms Number"),
                        10.he,
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                    filterTextFieldCursorColor,
                                  inputType: TextInputType.number,
                                  label: 'Min',
                                  controller: _controllers[4],
                                )),
                            10.wi,
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                    filterTextFieldCursorColor,
                                  inputType: TextInputType.number,
                                  label: 'Max',
                                  controller: _controllers[5],
                                )),
                          ],
                        ),
                        15.he,
                        getTitle("Bathrooms"),
                        10.he,
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                    filterTextFieldCursorColor,
                                  inputType: TextInputType.number,
                                  label: 'Min',
                                  controller: _controllers[6],
                                )),
                            10.wi,
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                    filterTextFieldCursorColor,
                                  inputType: TextInputType.number,
                                  label: 'Max',
                                  controller: _controllers[7],
                                )),
                          ],
                        ),
                        15.he,
                        getTitle("Area Range"),
                        10.he,
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                    filterTextFieldCursorColor,
                                  inputType: TextInputType.number,
                                  label: 'Min',
                                  controller: _controllers[8],
                                )),
                            10.wi,
                            Expanded(
                                flex: 1,
                                child: RoundedTextField(
                                  cursorColor:
                                    filterTextFieldCursorColor,
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
            15.he,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: SizedBox(
                width: double.infinity,
                child: Consumer<ExploreViewModel>(
                  builder: (_,viewModel,__){
                    return RoundedButton(
                        text: StringManager.submit,
                        onClick: (){
                          List<String> req = [];
                          for(var controller in _controllers){
                            req.add(controller.text.trim());
                          }
                          viewModel.requirements = req;
                          Navigator.pop(context, false);
                        }
                    );

                  }
                ),
              ),
            ),
            15.he,
          ],
        ),
      ),
    );
  }
}
