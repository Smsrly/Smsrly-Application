import 'package:smsrly/models/realestate.dart';

class User{

  String token = "";

  late String userId;


  late String username;



  late String email;



  late String phoneNumber;


  late double longitude;


  late double latitude;



  late String pictureUrl;

  final Map<int , RealEstate> _savedRealEstates={};

  bool isSaved(RealEstate item){
    return _savedRealEstates.containsKey(item.realEstateId);
  }
  void saveRealEstate(RealEstate item){
    _savedRealEstates[item.realEstateId] = item;
  }
  void unSaveRealEstate(RealEstate item){
    _savedRealEstates.remove(item.realEstateId);
  }

  User(this.userId,
      this.username,
      this.email,
      this.phoneNumber,
      this.latitude,
      this.longitude,
      this.pictureUrl);





}