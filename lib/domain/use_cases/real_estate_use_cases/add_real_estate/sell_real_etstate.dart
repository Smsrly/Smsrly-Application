import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smsrly/domain/repository/realestate_repository.dart';
import 'package:smsrly/models/validator.dart';
import 'package:smsrly/res/strings.dart';

import 'package:smsrly/models/realestate.dart';

class SellRealEstateUseCase {
  final RealEstateRepository repository;
  late ValidationService _validationService;

  SellRealEstateUseCase(this.repository) {
    _validationService = ValidationService();
  }

  String? response;

  Future<String?> uploadRealEstate(
      String title,
      double price,
      String description,
      bool isSell,
      int floorNumber,
      int roomNumber,
      int bathroomNumber,
      double area,
      LatLng location,
      String phoneNumber) async {
    try {
      String response = _validatingRealEstate(title, description, area,
          floorNumber, bathroomNumber, roomNumber, price, phoneNumber);

      String city = await getLocationDetails(location, true);
      String country = await getLocationDetails(location, false);

      if (response != StringManager.success) return response;

      final res = await repository.uploadRealEstate(RealEstate(
          isSale: isSell,
          title: title,
          description: description,
          area: area,
          floor: floorNumber,
          bathroomsNo: bathroomNumber,
          roomsNo: roomNumber,
          price: price,
          longitude: location.longitude,
          latitude: location.latitude,
          country: country,
          city: city));

      if (res!.contains(StringManager.realEstateUploaded)) {
        this.response = res;
        return StringManager.realEstateUploaded;
      }
      return res;
    } catch (error) {
      return error.toString();
    }
  }

  Future<String?> uploadRealEstateImages(List<File> files) async {
    int realEstateId = getRealEstateId(response!);

    if (realEstateId == -1) return null;

    final res = await repository.uploadRealEstateImages(files, realEstateId);

    return res;
  }

  int getRealEstateId(String response) {
    // Split the real estate string by the word "id"
    List<String> parts = response.split("id");

    // If the string doesn't contain "id", return -1
    if (parts.length < 2) {
      return -1;
    }

    // Parse the number after "id" and return it
    return int.tryParse(parts[1].trim()) ?? -1;
  }

  Future getLocationDetails(LatLng location, bool isCity) async {
    List<Placemark> place =
        await placemarkFromCoordinates(location.latitude, location.longitude);

    if (isCity) {
      return place[0].administrativeArea;
    }
    return place[0].country;
  }

  bool _isValidRealEstateText(String text, bool isTitle) {
    RegExp pattern;

    if (isTitle) {
      pattern = RegExp(
          r'^[a-zA-Z\s]{10,20}$'); // title name should be between 10 and 20 characters long
    } else {
      pattern = RegExp(
          r'^[a-zA-Z\s]{20,150}$'); // description name should be between 20 and 150 characters long
    }

    return pattern.hasMatch(text);
  }

  String _validatingRealEstate(
      String title,
      String description,
      double area,
      int floorNumber,
      int bathroomNumber,
      int roomNumber,
      double price,
      String phoneNumber) {
    if (!_isValidRealEstateText(title, true)) {
      return StringManager.realEstateTitleInvalid;
    }

    if (!_isValidRealEstateText(description, false)) {
      return StringManager.realEstateDescriptionInvalid;
    }

    if (area < 1 || area > 1000000) return StringManager.realEstateAreaInvalid;

    if (floorNumber < 0 || floorNumber > 163) {
      return StringManager.realEstateFloorNumberInvalid;
    }

    if (bathroomNumber < 1 || bathroomNumber > 10) {
      return StringManager.realEstateBathroomInvalid;
    }

    if (roomNumber < 1 || roomNumber > 20) {
      return StringManager.realEstateRoomNumberInvalid;
    }

    if (price < 1000 || price > 1000000000) {
      return StringManager.realEstatePriceInvalid;
    }

    if (!_validationService.isValidNumber(phoneNumber)) {
      return StringManager.phoneNumberWaring;
    }
    return StringManager.success;
  }
}
