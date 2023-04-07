import 'dart:async';
import 'dart:io';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smsrly/domain/use_cases/user_use_cases/sign_up_use_case/user_signup_use_case.dart';
import 'package:smsrly/main.dart';
import 'package:smsrly/utils/utils.dart';

import '../res/strings.dart';

class SignUpViewModel with ChangeNotifier {
  SignUpUseCase? _signUpUseCase;
  String? email;
  bool _isLoading = false;
  get isLoading => _isLoading;
  PickedFile? _image;
  bool _locationPermissionGranted = false;
  bool _locationDeniedForever = false;

  PickedFile get image {
    return _image!;
  }

  var isPasswordVisible = false;

  void togglePassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  var isConfirmPasswordVisible = false;

  void toggleConfirmPassword() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  CountryCode? _countryCode;

  CountryCode? get countryCode => _countryCode;

  void changeCountryCode(CountryCode code) {
    _countryCode = code;
    notifyListeners();
  }

  void changeImage(PickedFile pickedFile) {
    _image = pickedFile;
    notifyListeners();
  }

  bool hasNoImage() {
    return _image == null;
  }

  void signUp(String firstName, String secondName, String email,
      String phoneNumber, String password, String confirmPassword,
      Function() onSuccess
      ) async {
    if(!_isLoading){
      _isLoading = true;
      notifyListeners();
      _signUpUseCase ??= SignUpUseCase(repository!);
      if (_countryCode != null) {
        phoneNumber = "${_countryCode!.dialCode}$phoneNumber";
      } else {
        phoneNumber = "+20$phoneNumber";
      }
      while (!_locationPermissionGranted && !_locationDeniedForever) {
        await _checkLocationPermission();
        if (!_locationPermissionGranted) {
          Utils.showToast(StringManager.weNeedYouLoc, 1);
          await Future.delayed(const Duration(seconds: 3), () {});
        }
      }
      double? lat;
      double? long;
      if (_locationPermissionGranted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        print(position);
        lat = position.latitude;
        long = position.longitude;
      }

      String res = await _signUpUseCase!.signUp(
          firstName,
          secondName,
          email,
          phoneNumber,
          password,
          confirmPassword,
          lat,
          long,
          _image != null ? File(_image!.path) : null);

      Utils.showToast(res, 1);
      if(res == StringManager.verificationCodeSent){
        this.email = email;
        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    }


  }

  Future _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await _requestLocationPermission();
    } else {
      _locationPermissionGranted = true;
    }
  }

  Future _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      _locationDeniedForever = true;
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      _locationPermissionGranted = false;
    } else {
      _locationPermissionGranted = true;
    }
  }

  void onDestroy(){
    _signUpUseCase = null;
    email = null;
    _image = null;
    _isLoading = false;
  }

}
