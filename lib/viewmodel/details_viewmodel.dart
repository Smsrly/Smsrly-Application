import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smsrly/domain/repository/realestate_repository.dart';
import 'package:smsrly/domain/use_cases/real_estate_use_cases/delete_real_estate/delete_real_estate_use_case.dart';
import 'package:smsrly/domain/use_cases/real_estate_use_cases/request_use_cases/delete_request_use_case.dart';
import 'package:smsrly/models/realestate.dart';
import 'package:smsrly/models/user_info.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/utils/utils.dart';

import '../domain/use_cases/real_estate_use_cases/request_use_cases/request_use_case.dart';
import '../models/user.dart';

class DetailsViewModel with ChangeNotifier{
  RealEstateRepository realEstateRepository;
  late RequestUseCase _realEstateRequestUseCase;
  late DeleteRequestUseCase _deleteRequestUseCase;
  late DeleteUseCase _deleteUseCase;
  User? currUser;
  DetailsViewModel(this.realEstateRepository,this.currUser){
    _realEstateRequestUseCase = RequestUseCase(realEstateRepository);
    _deleteRequestUseCase = DeleteRequestUseCase(realEstateRepository);
    _deleteUseCase = DeleteUseCase(realEstateRepository);
  }
  RealEstate? currRealEstate;
  bool isTheOwner = false;

  void deleteRealEstate() async {
    if (currRealEstate?.userInfo ==null){
      final res = await _deleteUseCase.delete(currRealEstate!.realEstateId!);
      if(res == StringManager.hasDeleted){
        Utils.showToast(StringManager.deletedBefore, 1);
      }
    }
  }

  get realEstateLocation => LatLng(currRealEstate!.latitude,currRealEstate!.longitude);

  void onRefresh() async {
    final res = await realEstateRepository.getRequestsOfRealEstate(currRealEstate!.realEstateId!);
    if(res is List<UserInfo> ){
      print('$res');
      if(res.length != currRealEstate!.requestedBy!.length){
        currRealEstate!.requestedBy = res;
        notifyListeners();
      }
    }else if(res is String){
      Utils.showToast(res, 1);
    }
  }

  Future<bool> toggleRequest() async {
    bool res = false;
    if(currUser!.phoneNumber == StringManager.noPhoneNumber){
      Utils.showToast(StringManager.requestInvalid, 1);
    }
    if(currRealEstate != null){
      currRealEstate!.hasRequested = !currRealEstate!.hasRequested!;
      if(currRealEstate!.hasRequested!){
        requestRealEstate();
        res = true;
      }else{
        deleteRequestRealEstate();
        res = false;
      }
    }
    notifyListeners();
    return res;
  }

  get statue {
    if(isTheOwner){
      return StringManager.deleteItem;
    } else if(currRealEstate!.hasRequested!){
      return StringManager.removeRequestOfItem;
    } else if(!currRealEstate!.hasRequested!){
      return StringManager.request;
    }
  }

  void requestRealEstate()async{
    await _realEstateRequestUseCase.request(currRealEstate!.realEstateId!);
  }
  void deleteRequestRealEstate()async{
    await _deleteRequestUseCase.deleteRequest(currRealEstate!.realEstateId!);
  }
}