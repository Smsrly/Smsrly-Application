import 'package:flutter/foundation.dart';
import 'package:smsrly/domain/repository/user_repository.dart';
import 'package:smsrly/models/realestate.dart';
import '../models/user.dart';
import '../utils/routes/route_name.dart';

class AppViewModel with ChangeNotifier {
  UserRepository userRepository;
  User? currUser;
  bool isLoading = false;
  List<RealEstate>? _items;

  AppViewModel(this.userRepository);

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
}
