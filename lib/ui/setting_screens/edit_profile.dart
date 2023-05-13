import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/models/user.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/ui/widgets/text_fields/rounded_text_field.dart';
import 'package:smsrly/utils/utils.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';

import 'package:smsrly/viewmodel/edit_view_model.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_back_button.dart';
import 'package:smsrly/ui/widgets/google_maps.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AppViewModel>(context, listen: false);

    _firstController.text = viewModel.currUser!.firstName;
    _secondController.text = viewModel.currUser!.secondName;
    _phoneNumberController.text = viewModel.currUser!.phoneNumber;
    _emailController.text = viewModel.currUser!.email;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 350.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.sp),
                      bottomRight: Radius.circular(30.sp))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: RoundedBackButton(
                        backgroundColor:
                            const Color.fromRGBO(135, 169, 197, 0.6),
                        arrowColor: Colors.white,
                        iconSize: 15,
                        onClick: () {
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 110.h, left: 15.w, right: 15.w),
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      right: 15, left: 15, top: 40, bottom: 15),
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: boxShadowColor,
                          blurRadius: 50.0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringManager.basic,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      RoundedTextField(
                        controller: _firstController,
                        cursorColor: primaryColor,
                        label: StringManager.first,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      RoundedTextField(
                        controller: _secondController,
                        cursorColor: primaryColor,
                        label: StringManager.second,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      RoundedTextField(
                        enable: false,
                        controller: _emailController,
                        cursorColor: primaryColor,
                        label: StringManager.email,
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      RoundedTextField(
                        controller: _phoneNumberController,
                        cursorColor: primaryColor,
                        label: StringManager.phoneNum,
                        inputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        StringManager.location,
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                          height: 150.h,
                          width: double.infinity,
                          // Map Here
                          child: Consumer<AppViewModel>(
                            builder: (context, appViewModel, child) {
                              return GoogleMapsWidget(
                                  appViewModel.userLocation, true);
                            },
                          )),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Consumer<EditProfileViewModel>(
                                builder:
                                    (context, editProfileViewModel, child) {
                                  return RoundedButton(
                                    onClick: () {
                                      editProfileViewModel.updateUserInfo(
                                          _firstController.text,
                                          _secondController.text,
                                          _emailController.text,
                                          _phoneNumberController.text,
                                          viewModel.location,
                                          viewModel.currUser!);
                                    },
                                    text: StringManager.submit,
                                    visible: !editProfileViewModel.isLoading,
                                  );

                                  //     return ElevatedButton(
                                  //   onPressed: () {
                                  //     editProfileViewModel.updateUserInfo(
                                  //         _firstController.text,
                                  //         _secondController.text,
                                  //         _emailController.text,
                                  //         _phoneNumberController.text,
                                  //         viewModel.location,
                                  //         viewModel.currUser!);
                                  //   },
                                  //   style: ElevatedButton.styleFrom(
                                  //     backgroundColor: primaryColor,
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius:
                                  //           BorderRadius.circular(18.0),
                                  //     ),
                                  //   ),
                                  //   child: const Padding(
                                  //     padding: EdgeInsets.all(15.0),
                                  //     child: Text(StringManager.submit),
                                  //   ),
                                  // );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 70.h),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  SizedBox(
                    child: viewModel.currUser!.pictureUrl != null
                        ? CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                NetworkImage(viewModel.currUser!.pictureUrl!),
                          )
                        : Image.asset(StringManager.profilePlaceholder),
                  ),
                  CircleAvatar(
                    radius: 16,
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 16,
                      ),
                      onPressed: () {
                        Utils.showToast(
                            'coming soon, this feature is not available at that time',
                            1);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
