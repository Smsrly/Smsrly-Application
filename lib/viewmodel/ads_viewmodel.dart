import 'package:flutter/foundation.dart';
import 'package:smsrly/domain/repository/realestate_repository.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/utils/utils.dart';

import '../domain/use_cases/real_estate_use_cases/ads_use_cases/get_ads_use_case.dart';
import '../models/realestate.dart';

class AdsViewModel with ChangeNotifier{

  RealEstateRepository realEstateRepository;
  late GetAdsUseCase _getAdsUseCase;

  AdsViewModel(this.realEstateRepository){
    _getAdsUseCase = GetAdsUseCase(realEstateRepository);
  }

  List<RealEstate>? uploadedItems;
  bool isUploadedLoading = false;
  
  Future getUploadedItems(bool forRefresh) async {
    print('bool1 => ${!forRefresh && uploadedItems != null && uploadedItems!.isNotEmpty}');
    print('bool2 => ${forRefresh && (uploadedItems != null && uploadedItems!.isNotEmpty)}');
    if(!forRefresh && uploadedItems != null && uploadedItems!.isNotEmpty){
      return;
    }
    isUploadedLoading = true;
    notifyListeners();
    print('inos');
    final res = await _getAdsUseCase.getUploads();
    if(res is List<RealEstate>){
      uploadedItems = res;
    } else {
      Utils.showToast(StringManager.wentWrong, 1);
    }
    isUploadedLoading = false;
    notifyListeners();
  }

  List<RealEstate>? requestedItems;
  bool isRequestedLoading = false;

  Future getRequestedItems(bool forRefresh) async {
    print('bool1 => ${!forRefresh && requestedItems != null && requestedItems!.isNotEmpty}');
    print('bool2 => ${forRefresh && (requestedItems != null && requestedItems!.isNotEmpty)}');
    if(!forRefresh && requestedItems != null && requestedItems!.isNotEmpty){
      return;
    }
    isRequestedLoading = true;
    notifyListeners();
    print('inos');
    final res = await _getAdsUseCase.getRequests();
    if(res is List<RealEstate>){
      requestedItems = res;
    } else {
      Utils.showToast(StringManager.wentWrong, 1);
    }
    isRequestedLoading = false;
    notifyListeners();
  }

  List<RealEstate>? savedItemsList;
  bool isSavedLoading = false;

  Future getSavedItems(bool forRefresh) async {
    print('bool1 => ${!forRefresh && savedItemsList != null && savedItemsList!.isNotEmpty}');
    print('bool2 => ${forRefresh && (savedItemsList != null && savedItemsList!.isNotEmpty)}');
    if(!forRefresh && savedItemsList != null && savedItemsList!.isNotEmpty){
      return;
    }
    isSavedLoading = true;
    notifyListeners();
    print('inos');
    final res = await _getAdsUseCase.getSaves();
    if(res is List<RealEstate>){
      savedItemsList = res;
    } else {
      Utils.showToast(StringManager.wentWrong, 1);
    }
    isSavedLoading = false;
    notifyListeners();
  }


}