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
  bool isLoading = false;


  Future getUploadedItems(bool forRefresh) async {
    print('bool1 => ${!forRefresh && uploadedItems != null && uploadedItems!.isNotEmpty}');
    print('bool2 => ${forRefresh && (uploadedItems != null && uploadedItems!.isNotEmpty)}');
    if(!forRefresh && uploadedItems != null && uploadedItems!.isNotEmpty){
      return;
    }
    isLoading = true;
    notifyListeners();
    print('inos');
    final res = await _getAdsUseCase.getUploads();
    if(res is List<RealEstate>){
      uploadedItems = res;
    } else {
      Utils.showToast(StringManager.wentWrong, 1);
    }
    isLoading = false;
    notifyListeners();
  }
}