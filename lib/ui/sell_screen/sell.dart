import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/ui/widgets/google_maps.dart';
import 'package:smsrly/ui/widgets/text_fields/rounded_text_field.dart';
import 'package:smsrly/viewmodel/sell_view_model.dart';

import 'package:smsrly/viewmodel/app_view_model.dart';

import '../widgets/buttons/rounded_normal_button.dart';

class SellScreen extends StatelessWidget {
  SellScreen({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _floorsController = TextEditingController();
  final TextEditingController _roomsController = TextEditingController();
  final TextEditingController _bathroomsController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();

  Widget textField(String text, String label, TextInputType inputType,
      TextEditingController textEditingController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: text.isNotEmpty,
          child: Container(
            padding: EdgeInsets.only(left: 5.w, bottom: 6.h),
            child: Text(
              text,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ),
        RoundedTextField(
          controller: textEditingController,
          cursorColor: primaryColor,
          textStyle: TextStyle(fontSize: 18.sp),
          label: label,
          inputType: inputType,
        ),
      ],
    );
  }

  Widget radioButton(bool isSell, String text) {
    return Row(
      children: <Widget>[
        Consumer<SellViewModel>(
          builder: (context, sellViewModel, child) {
            return Radio(
              activeColor: primaryColor,
              value: isSell,
              groupValue: sellViewModel.isSell,
              onChanged: (newValue) {
                sellViewModel.setSelectedRadio(newValue!);
              },
            );
          },
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20.sp),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AppViewModel>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(top: 14.h, left: 14.w, right: 14.w),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      StringManager.appName,
                      style: TextStyle(fontFamily: "Inter", fontSize: 22.sp),
                    )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Consumer<SellViewModel>(
                      builder: (context, sellViewModel, child) {
                        return InkWell(
                          child: Container(
                              height: 200.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.black38,
                                    width: 1,
                                  )),
                              child: sellViewModel.hasNoImages
                                  ? Center(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                          Image(
                                              image: const AssetImage(
                                                  "assets/images/add.png"),
                                              width: 20.w,
                                              height: 20.h),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Text(
                                            StringManager.add,
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                fontFamily: "IBMPlexSans",
                                                fontWeight: FontWeight.w500),
                                          )
                                        ]))
                                  : CarouselSlider.builder(
                                      options: CarouselOptions(
                                        enlargeCenterPage: true,
                                        enableInfiniteScroll: false,
                                      ),
                                      itemCount: sellViewModel.numOfImages,
                                      itemBuilder: (context, index, realIndex) {
                                        return ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(18)),
                                          child: Image.file(
                                              File(sellViewModel
                                                  .getImagePath(index)),
                                              fit: BoxFit.fill),
                                        );
                                      })),
                          onTap: () async {
                            final image =
                                await ImagePicker.platform.getMultiImage();
                            if (image != null) {
                              sellViewModel.addImages(image);
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    textField(StringManager.title, "", TextInputType.text,
                        _titleController),
                    SizedBox(
                      height: 15.h,
                    ),
                    textField(StringManager.price, "", TextInputType.number,
                        _priceController),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.w, bottom: 6.w),
                      child: Text(
                        StringManager.description,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 8,
                      style: TextStyle(
                          fontSize: 18.sp, overflow: TextOverflow.clip),
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: const BorderSide(
                            color: primaryColor,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(170, 171, 170, 1),
                              width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.w, bottom: 6.w),
                      child: Text(
                        StringManager.location,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),

                    // ignore: prefer_const_constructors

                    SizedBox(
                        height: 150.h,
                        width: double.infinity,
                        // Map Here
                        child: Consumer<AppViewModel>(
                          builder: (context, appViewModel, child) {
                            return GoogleMapsWidget(
                                appViewModel.location, true);
                          },
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: textField("", StringManager.floors,
                              TextInputType.number, _floorsController),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: textField("", StringManager.rooms,
                              TextInputType.number, _roomsController),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: textField("", StringManager.bathrooms,
                              TextInputType.number, _bathroomsController),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: textField("", StringManager.area,
                              TextInputType.number, _areaController),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Expanded(flex: 1, child: radioButton(true, "Sell")),
                    Expanded(flex: 1, child: radioButton(false, "Rent")),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Consumer<SellViewModel>(
                  builder: (context, sellViewModel, child) {
                    return RoundedButton(
                      onClick: () async {
                        String? res = await sellViewModel.uploadRealEstate(
                            _titleController.text,
                            _priceController.text,
                            _descriptionController.text,
                            _floorsController.text,
                            _roomsController.text,
                            _bathroomsController.text,
                            _areaController.text,
                            viewModel.location,
                            viewModel.currUser!.phoneNumber);

                        if (res ==
                            StringManager.onRealEstateUploadedSuccessfully) {
                          _titleController.text = '';
                          _priceController.text = '';
                          _descriptionController.text = '';
                          _floorsController.text = '';
                          _roomsController.text = '';
                          _bathroomsController.text = '';
                          _areaController.text = '';
                        }
                      },
                      text: StringManager.submit,
                      visible: !sellViewModel.isLoading,
                    );

                    // return ElevatedButton(
                    //   onPressed: () {
                    //     sellViewModel.uploadRealEstate(
                    //         _titleController.text,
                    //         double.parse(_priceController.text),
                    //         _descriptionController.text,
                    //         int.parse(_floorsController.text),
                    //         int.parse(_roomsController.text),
                    //         int.parse(_bathroomsController.text),
                    //         double.parse(_areaController.text),
                    //         viewModel.location);
                    //   },
                    //   style: ButtonStyle(
                    //       shape: MaterialStatePropertyAll(
                    //           RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(14))),
                    //       backgroundColor:
                    //           const MaterialStatePropertyAll(primaryColor),
                    //       fixedSize:
                    //           const MaterialStatePropertyAll(Size(328, 49))),
                    //   child: Text(
                    //     StringManager.submit,
                    //     style: TextStyle(fontSize: 16.sp),
                    //   ),
                    // );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            )),
      ),
    );
  }
}
