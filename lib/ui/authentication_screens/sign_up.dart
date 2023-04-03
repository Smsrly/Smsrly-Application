import 'dart:io';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/dimen.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/ui/widgets/text_fields/text_field_with_bottom_border.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/sign_up_view_model.dart';

import '../../res/colors.dart';
import '../../utils/routes/route_name.dart';

class SignUpScreen extends StatelessWidget {

  SignUpScreen({Key? key}) : super(key: key);

  final _countryPicker = const FlCountryCodePicker();
  final Widget _flag = Image.asset(StringManager.egyptFlag);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();


  Widget profilePicture(){
    return Consumer<SignUpViewModel>(
        builder: (context,signUpViewModel,child){
          return SizedBox(
            width: 120 ,
            height: 120 ,
            child: InkWell(
              child: Center(
                child: Stack(alignment: Alignment.center, children: [
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                        signUpViewModel.hasNoImage() ?
                        const AssetImage(
                            StringManager.profilePlaceholder
                        )
                        : FileImage(File(signUpViewModel.image.path)) as ImageProvider,
                      )
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                                StringManager.cameraIcon))
                      ],
                    ),
                  )
                ]),
              ),
              onTap: () async{
                final image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
                if(image != null){
                  signUpViewModel.changeImage(image);
                }
              },
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: Dimensions.contentSymmetricPadding,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  15.h.he,
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringManager.signUp,
                            style: AppStyles.headline1),
                      ],
                    ),
                  ),
                  15.h.he,
                  profilePicture(),
                  25.h.he,
                  TextFieldWithBottomBorder(
                    label: StringManager.first,
                    inputType: TextInputType.name,
                    fontSize: 18.sp,
                    controller: _firstNameController,
                  ),
                  25.h.he,
                  TextFieldWithBottomBorder(
                      label: StringManager.second,
                      inputType: TextInputType.name,
                      fontSize: 18.sp,
                      controller: _secondNameController,
                  ),
                  25.h.he,
                  TextFieldWithBottomBorder(
                      label: StringManager.email,
                      inputType: TextInputType.emailAddress,
                      controller: _emailController,
                      fontSize: 18.sp),
                  25.h.he,
                  Consumer<SignUpViewModel>(
                      builder: (context,viewModel,child){
                        return TextFieldWithBottomBorder(
                          label: StringManager.phoneNum,
                          inputType: TextInputType.number,
                          inputFormatter: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          fontSize: 18.sp,
                          prefixIcon: Container(
                            width: 80,
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.all(3),
                            child: InkWell(
                              onTap: () async {
                                var code =
                                await _countryPicker.showPicker(context: context);
                                if(code != null){
                                  viewModel.changeCountryCode(code);
                                }
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                    child: viewModel.countryCode != null
                                        ? viewModel.countryCode!.flagImage
                                        : _flag,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                      viewModel.countryCode == null
                                          ? StringManager.egyptCountryCode
                                          : viewModel.countryCode!.dialCode,
                                      style: AppStyles.bodyTextWithCursorColor
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                  25.he,
                  Consumer<SignUpViewModel>(
                      builder: (context,signUpViewModel,child){
                        return TextFieldWithBottomBorder(
                          label: StringManager.password,
                          fontSize: 18.sp,
                          obscureText: !signUpViewModel.isPasswordVisible,
                          controller: _passController,
                          inputType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                              onPressed: () => signUpViewModel.togglePassword()
                              ,
                              icon: Icon(!signUpViewModel.isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility)
                          ),
                        );
                      }
                  ),
                  25.h.he,
                  Consumer<SignUpViewModel>(
                      builder: (context,signUpViewModel,child){
                        return TextFieldWithBottomBorder(
                          label: StringManager.password,
                          fontSize: 18.sp,
                          obscureText: !signUpViewModel.isConfirmPasswordVisible,
                          controller: _confirmPassController,
                          inputType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                              onPressed: () => signUpViewModel.toggleConfirmPassword()
                              ,
                              icon: Icon(!signUpViewModel.isConfirmPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility)
                          ),
                        );
                      }
                  ),
                  30.h.he,
                  SizedBox(
                    width: double.infinity,
                    child: Consumer<SignUpViewModel>(
                      builder: (context,viewModel,child){
                        return RoundedButton(
                          onClick: () {
                            viewModel.signUp(
                                _firstNameController.text,
                                _secondNameController.text,
                                _emailController.text,
                                _phoneNumberController.text,
                                _passController.text,
                                _confirmPassController.text
                            );
                          },
                          text: StringManager.signUp,
                        );
                      },
                    ),
                  ),
                  3.h.he,
                  Row(
                    mainAxisAlignment: width > 200
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Text(
                        StringManager.haveAnAccount,
                        style: AppStyles.bodyText2,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context,RouteName.loginRoute);
                          },
                          child: Text(
                              StringManager.login,
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontFamily: StringManager.ibmPlexSans,
                                  fontWeight: FontWeight.w400,
                              ))
                      ),

                    ],
                  ),
                  20.h.he
                ]),
          ),
        ),
      ),
    );
  }
}
