import 'owner_info.dart';

class RealEstate {

  int realEstateId;
  bool isSale;
  List<String> imageUrl;
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
  OwnerInfo ownerInfo;
  bool? hasSaved;

  RealEstate(
      this.realEstateId,
      this.isSale,
      this.imageUrl,
      this.title,
      this.description,
      this.area,
      this.floor,
      this.bathroomsNo,
      this.roomsNo,
      this.price,
      this.longitude,
      this.latitude,
      this.country,
      this.city,
      this.hasSaved,
      this.ownerInfo);

  factory RealEstate.fromJson(Map<String, dynamic> data,List<String> imagesUrls) {
    return RealEstate(
        data['id'],
        data['isSale'],
        imagesUrls,
        data['title'],
        data['description'],
        data['area'],
        data['floorNumber'],
        data['bathroomNumber'],
        data['roomNumber'],
        data['price'],
        data['longitude'],
        data['longitude'],
        data['country'],
        data['city'],
        data['hasSaved'],
        OwnerInfo.fromJson(data['ownerInfo'])
    );
  }
}
