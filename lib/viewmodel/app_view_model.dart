import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smsrly/domain/repository/user_repository.dart';
import 'package:smsrly/models/realestate.dart';
import '../models/user.dart';
import '../utils/routes/route_name.dart';

class AppViewModel with ChangeNotifier {
  UserRepository userRepository;
  User? currUser;
  bool isLoading = false;
  List<RealEstate>? _items;
  Map<int,RealEstate>? _itemsMap;
  LatLng? _location;

  AppViewModel(this.userRepository);
  
  get userLocation => LatLng(currUser!.latitude!, currUser!.longitude!);

  get location => _location ?? LatLng(currUser!.latitude!, currUser!.longitude!);

  changeLocation(LatLng location) {
    _location = location;
    notifyListeners();
  }

  set realEstateItemsMap(Map<int,RealEstate> map){
    _itemsMap = map;
  }

  Map<int,RealEstate> get realEstateItemsMap {
    return _itemsMap!;
  }

  List<RealEstate> get realEstateItems {
    return _items!;
  }

  set realEstateItems(List<RealEstate> list){
    _items = list;
  }
  void setSeenOnBoarding() async {
    userRepository.setSeenOnBoarding();
  }

  bool hasSeenOnBoarding() {
    return userRepository.hasSeenOnBoarding();
  }

  bool hasUserSignedInBefore() {
    return userRepository.hasUserSignedInBefore();
  }

  String getStartScreen() {
    print('getStartScreen');
    if (hasUserSignedInBefore()) {
      return RouteName.splashRoute;
    } else if (hasSeenOnBoarding()) {
      return RouteName.loginRoute;
    } else {
      return RouteName.onBoardingRoute;
    }
  }
  void deleteAccount() async {
    await userRepository.deleteAccount();
    onDestroy();
  }
  void logout()async{
    await userRepository.logout();
    onDestroy();
  }
  void onDestroy(){
    currUser = null;
    _items?.clear();
    _itemsMap?.clear();
  }
}
