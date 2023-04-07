
import 'package:smsrly/models/realestate.dart';

class User {
  late String userId;
  late String firstName;
  late String secondName;
  late String email;
  late String phoneNumber;
  late double longitude;
  late double latitude;
  String? pictureUrl;
  final Map<int, RealEstate> _savedRealEstates = {};

  String get username=> "$firstName $secondName";


  bool isSaved(RealEstate item) {
    return _savedRealEstates.containsKey(item.realEstateId);
  }

  void saveRealEstate(RealEstate item) {
    _savedRealEstates[item.realEstateId] = item;
  }

  void unSaveRealEstate(RealEstate item) {
    _savedRealEstates.remove(item.realEstateId);
  }

  User(
      {required this.userId,
      required this.firstName,
      required this.secondName,
      required this.email,
      required this.phoneNumber,
      required this.latitude,
      required this.longitude,
      this.pictureUrl});
}
