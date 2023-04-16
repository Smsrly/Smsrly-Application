class UserInfo{
  String phoneNumber;
  String? imageUrl;
  String name;

  UserInfo({
    required this.name,
    required this.phoneNumber,
    required this.imageUrl
  });
  
  factory UserInfo.fromJson(Map<String,dynamic> data){
    return UserInfo(
        name: data['name'],
        phoneNumber: '+${data['phoneNumber']}',
        imageUrl: data['image']
    );
  }

}