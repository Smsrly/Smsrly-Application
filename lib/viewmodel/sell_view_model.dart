import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smsrly/domain/repository/realestate_repository.dart';

import 'package:smsrly/domain/use_cases/real_estate_use_cases/add_real_estate/sell_real_etstate.dart';
import 'package:smsrly/res/strings.dart';

import 'package:smsrly/utils/utils.dart';

class SellViewModel extends ChangeNotifier {
  RealEstateRepository realEstateRepository;
  late SellRealEstateUseCase _sellRealEstateUseCase;

  SellViewModel(this.realEstateRepository) {
    _sellRealEstateUseCase = SellRealEstateUseCase(realEstateRepository);
  }

  bool isSell = true;

  setSelectedRadio(bool val) {
    isSell = val;
    notifyListeners();
  }

  bool _isLoading = false;

  get isLoading => _isLoading;

  final List<XFile> _pickedFileList = [];

  get numOfImages => _pickedFileList.length;

  get hasNoImages => _pickedFileList.isEmpty;

  String getImagePath(int index) {
    return _pickedFileList[index].path;
  }

  void addImages(List<XFile> pickedFiles) {
    if (!hasNoImages) {
      _pickedFileList.removeRange(0, _pickedFileList.length);
    }

    if (pickedFiles.isNotEmpty) {
      _pickedFileList.addAll(pickedFiles);
    }

    notifyListeners();
  }

  Future<String?> uploadRealEstate(
      String title,
      String price,
      String description,
      String floors,
      String rooms,
      String bathrooms,
      String area,
      LatLng location) async {
    if (!_isLoading) {
      _isLoading = true;
      notifyListeners();

      if (_pickedFileList.length < 5) {
        _isLoading = false;
        notifyListeners();
        Utils.showToast(StringManager.minNumberOfImages, 1);
        return null;
      }

      if (_pickedFileList.length > 20) {
        _isLoading = false;
        notifyListeners();
        Utils.showToast(StringManager.maxNumberOfImages, 1);
        return null;
      }

      String valid = _validatingTextIsNotNull(
          title, price, description, floors, rooms, bathrooms, area);

      if (valid != StringManager.success) {
        _isLoading = false;
        notifyListeners();
        Utils.showToast(valid, 1);
        return null;
      }

      List<File> files = [];
      for (XFile xFile in _pickedFileList) {
        files.add(convertXFileToNativeFile(xFile));
      }

      String? res = await _sellRealEstateUseCase.uploadRealEstate(
          title,
          double.parse(price),
          description,
          isSell,
          int.parse(floors),
          int.parse(rooms),
          int.parse(bathrooms),
          double.parse(area),
          location);

      if (res != StringManager.realEstateUploaded) {
        _isLoading = false;
        notifyListeners();
        Utils.showToast(
            "Error in upload real estate details: ${res.toString()}", 1);
        return null;
      }

      String? resImage =
          await _sellRealEstateUseCase.uploadRealEstateImages(files);

      if (resImage != StringManager.realEstateImageUploaded) {
        _isLoading = false;
        notifyListeners();
        Utils.showToast(
            "Error in upload real estate images: ${resImage.toString()}", 1);
        return null;
      }

      Utils.showToast(StringManager.onRealEstateUploadedSuccessfully, 1);
      _isLoading = false;
      notifyListeners();
    }
    return null;
  }

  _validatingTextIsNotNull(String title, String price, String description,
      String floors, String rooms, String bathrooms, String area) {
    if (title.isEmpty) return StringManager.realEstateTitleInvalid;
    if (price.isEmpty) return StringManager.realEstatePriceInvalid;
    if (description.isEmpty) return StringManager.realEstateDescriptionInvalid;
    if (floors.isEmpty) return StringManager.realEstateFloorNumberInvalid;
    if (rooms.isEmpty) return StringManager.realEstateRoomNumberInvalid;
    if (bathrooms.isEmpty) return StringManager.realEstateBathroomInvalid;
    if (area.isEmpty) return StringManager.realEstateAreaInvalid;

    return StringManager.success;
  }

  File convertXFileToNativeFile(XFile xFile) {
    final file = File(xFile.path);
    return file;
  }
}
