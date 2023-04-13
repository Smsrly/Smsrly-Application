class OwnerInfo{
  String phoneNumber;
  String imageUrl;
  String name;
  
  OwnerInfo({
    required this.name,
    required this.phoneNumber,
    required this.imageUrl
  });
  
  factory OwnerInfo.fromJson(Map<String,dynamic> data){
    return OwnerInfo(
        name: data['name'],
        phoneNumber: '+${data['phoneNumber']}',
        imageUrl: data['image']
    );
  }

}