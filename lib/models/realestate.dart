import 'user_info.dart';

class RealEstate {
  int? realEstateId;
  bool isSale;
  List<String>? imageUrl;
  String title;
  String description;
  double area;
  int floor;
  int bathroomsNo;
  int roomsNo;
  double price;
  double longitude;
  double latitude;
  String country;
  String city;
  UserInfo? userInfo;
  bool? hasSaved;
  bool? hasRequested;
  List<UserInfo>? requestedBy;

  RealEstate(
      {this.realEstateId,
      required this.isSale,
      this.imageUrl,
      required this.title,
      required this.description,
      required this.area,
      required this.floor,
      required this.bathroomsNo,
      required this.roomsNo,
      required this.price,
      required this.longitude,
      required this.latitude,
      required this.country,
      required this.city,
      this.hasSaved,
      this.hasRequested,
      this.userInfo,
      this.requestedBy});

  factory RealEstate.fromJson(
      Map<String, dynamic> data, List<String> imagesUrls) {
    List<UserInfo>? userRequestInfo;
    if (data['requestedBy'] != null) {
      userRequestInfo = [];
      for (var user in data['requestedBy']) {
        userRequestInfo.add(UserInfo.fromJson(user));
      }
    }

    return RealEstate(
        realEstateId: data['id'],
        isSale: data['isSale'],
        imageUrl: imagesUrls,
        title: data['title'],
        description: data['description'],
        area: data['area'],
        floor: data['floorNumber'],
        bathroomsNo: data['bathroomNumber'],
        roomsNo: data['roomNumber'],
        price: data['price'],
        longitude: data['longitude'],
        latitude: data['latitude'],
        country: data['country'],
        city: data['city'],
        hasSaved: data['hasSaved'],
        hasRequested: data['hasRequested'],
        userInfo: data['userInfo'] != null
            ? UserInfo.fromJson(data['userInfo'])
            : null,
        requestedBy: userRequestInfo);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'floorNumber': floor,
      'bathroomNumber': bathroomsNo,
      'roomNumber': roomsNo,
      'area': area,
      'price': price,
      'latitude': latitude,
      'longitude': longitude,
      'city': city,
      'country': country,
      'isSale': isSale,
    };
  }
}
