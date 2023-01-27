import 'package:smsrly/models/location.dart';
import 'package:smsrly/models/user.dart';

class RealEstate{
  late int _realEstateId;

  int get realEstateId => _realEstateId;

  set realEstateId(int value) {
    _realEstateId = value;
  }

  late String _imageUrl;

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  late String _title;

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  late User? _owner;

  User? get owner => _owner;

  set owner(User? value) {
    _owner = value;
  }

  late String _ownerId;

  String get ownerId => _ownerId;

  set ownerId(String value) {
    _ownerId = value;
  }

  late String _description;

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  late double _area;

  double get area => _area;

  set area(double value) {
    _area = value;
  }

  late int _floor;

  int get floor => _floor;

  set floor(int value) {
    _floor = value;
  }

  late int _bathroomsNo;

  int get bathroomsNo => _bathroomsNo;

  set bathroomsNo(int value) {
    _bathroomsNo = value;
  }

  late int _roomsNo;

  int get roomsNo => _roomsNo;

  set roomsNo(int value) {
    _roomsNo = value;
  }

  late double _price;

  double get price => _price;

  set price(double value) {
    _price = value;
  }


  late Location _location;

  Location get location => _location;

  set location(Location value) {
    _location = value;
  }


  late String? _country;


  String? get country => _country;

  set country(String? value) {
    _country = value;
  }

  late String? _city;


  String? get city => _city;

  set city(String? value) {
    _city = value;
  }

  RealEstate(
      this._realEstateId,
      this._imageUrl,
      this._title,
      this._owner,
      this._ownerId,
      this._description,
      this._area,
      this._floor,
      this._bathroomsNo,
      this._roomsNo,
      this._price,
      this._location,
      this._country,
      this._city);
}