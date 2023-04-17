
import 'package:smsrly/models/realestate.dart';

class User {
  String? userId;
  late String firstName;
  late String secondName;
  late String email;
  late String phoneNumber;
  double? longitude;
  double? latitude;
  String? pictureUrl;
  final Map<int, RealEstate> _savedRealEstates = {};

  String get username=> "$firstName $secondName";


  bool isSaved(RealEstate item) {
    return _savedRealEstates.containsKey(item.realEstateId);
  }

  void saveRealEstate(RealEstate item) {
    _savedRealEstates[item.realEstateId!] = item;
  }

  void unSaveRealEstate(RealEstate item) {
    _savedRealEstates.remove(item.realEstateId);
  }

  User(
      {this.userId,
      required this.firstName,
      required this.secondName,
      required this.email,
      required this.phoneNumber,
      this.latitude,
      this.longitude,
      this.pictureUrl});


  bool hasPicture(){
    return pictureUrl != null;
  }
  factory User.formJson(Map<String,dynamic> userMap){
    return User(
        firstName: userMap['firstName'],
        secondName: userMap['lastName'],
        email: userMap['email'],
        phoneNumber: "+${userMap['phoneNumber']}",
        latitude: userMap['latitude'],
        longitude: userMap['longitude'],
        pictureUrl: userMap['imageURL']
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'firstname' : firstName,
      'lastname' : secondName,
      'email' : email,
      'phoneNumber' : _phoneToInt(phoneNumber),
      'latitude' : latitude,
      'longitude' : longitude
    };
  }
  String _phoneToInt(String phoneNumber){
    var s = "";
    for(int i=1; i<phoneNumber.length; i++){
      s+=phoneNumber[i];
    }
    return s;
  }
}
