import 'package:smsrly/models/location.dart';
import 'package:smsrly/models/realestate.dart';

class User{

  late String _userId;

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }


  late String _username;

  String get username => _username;

  set username(String value) {
    _username = value;
  }


  late String _email;


  String get email => _email;

  set email(String value) {
    _email = value;
  }

  late String _phoneNumber;

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  late Location _location;

  Location get location => _location;

  set location(Location value) {
    _location = value;
  }

  late String _pictureUrl;

  String get pictureUrl => _pictureUrl;

  set pictureUrl(String value) {
    _pictureUrl = value;
  }
  final Map<int , RealEstate> _savedRealEstates={};

  void saveRealEstate(RealEstate item){
    _savedRealEstates[item.realEstateId] = item;
  }
  void unSaveRealEstate(RealEstate item){
    _savedRealEstates.remove(item.realEstateId);
  }

  User(this._userId, this._username, this._email, this._phoneNumber,
      this._location, this._pictureUrl);



}