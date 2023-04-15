import 'package:flutter/foundation.dart';

import '../domain/repository/realestate_repository.dart';
import '../domain/use_cases/real_estate_use_cases/save_real_estate/save_real_estate.dart';
import '../domain/use_cases/real_estate_use_cases/save_real_estate/unsave_real_estate.dart';
import '../models/realestate.dart';

class ExploreViewModel with ChangeNotifier{

  RealEstateRepository realEstateRepository;
  late SaveRealEstateUseCase _saveRealEstateUseCase;
  late UnSaveRealEstateUseCase _unSaveRealEstateUseCase;

  ExploreViewModel(this.realEstateRepository){
    _saveRealEstateUseCase = SaveRealEstateUseCase(realEstateRepository);
    _unSaveRealEstateUseCase = UnSaveRealEstateUseCase(realEstateRepository);
  }

  List<RealEstate> _realEstates = [];
  List<RealEstate> _filteredRealEstates=[];
  set realEstates(List<RealEstate> items){
    _realEstates = items;
    _filteredRealEstates = items;
  }
  List<RealEstate> get realEstates => _filteredRealEstates;

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
    await _saveRealEstateUseCase.save(realEstate.realEstateId);
  }
  void unSaveRealEstate(RealEstate realEstate) async {
    await _unSaveRealEstateUseCase.unSave(realEstate.realEstateId);
  }
}
