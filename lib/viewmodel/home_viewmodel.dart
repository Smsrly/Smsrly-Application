import 'package:flutter/foundation.dart';
import 'package:smsrly/domain/use_cases/real_estate_use_cases/save_real_estate/save_real_estate.dart';
import 'package:smsrly/domain/use_cases/real_estate_use_cases/save_real_estate/unsave_real_estate.dart';
import 'package:smsrly/main.dart';
import 'package:smsrly/models/realestate.dart';

class HomeViewModel with ChangeNotifier{

  void toggleRealEstate(RealEstate realEstate){
    realEstate.hasSaved = !realEstate.hasSaved!;
    if(realEstate.hasSaved!){
      saveRealEstate(realEstate);
    }else{
      unSaveRealEstate(realEstate);
    }
    notifyListeners();
  }
  void saveRealEstate(RealEstate realEstate) async {
    await SaveRealEstateUseCase(realEstateRepository!).save(realEstate.realEstateId);
  }
  void unSaveRealEstate(RealEstate realEstate) async {
    await UnSaveRealEstateUseCase(realEstateRepository!).unSave(realEstate.realEstateId);
  }
}