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

  final _requirements =[
    -1,1000000000000000000,
    -1,1000000000000000000,
    -1,1000000000000000000,
    -1,1000000000000000000,
    -1,1000000000000000000
  ];
  String getRequirement(int i){
    if(i % 2 == 0 && _requirements[i] != -1){
      return '${_requirements[i]}';
    }
    if(i % 2 != 0 && _requirements[i] != 1000000000000000000){
      return '${_requirements[i]}';
    }
    return "";
  }

  set requirements(List<String> strings){
    for (int i=0;i<strings.length;i++) {
      if(strings[i].isNotEmpty){
        _requirements[i] = int.parse(strings[i]);
      }else{
        _requirements[i] = i%2 == 0 ? -1 : 1000000000000000000;
      }
    }
    _runFilter(_searchedText);
    notifyListeners();
  }

  int _rentOrSale = -1;

  int get rentOrSale => _rentOrSale;

  set rentOrSale(int o){
    _rentOrSale = o;
    notifyListeners();
  }
  String _searchedText = '';
  set searchedText(String text){
    _searchedText = text;
    _runFilter(text);
  }

  void _runFilter(String text) async {
    List<RealEstate> elements = [];
    for (var item in _realEstates) {
      var bool1 = text.isEmpty ||
          item.city.toLowerCase().contains(text);
      var bool2 = text.isEmpty ||
          item.country.toLowerCase().contains(text);
      var bool3 = _rentOrSale == -1;
      if(!bool3){
        bool3 = (item.isSale && _rentOrSale == 0) || (!item.isSale && _rentOrSale == 1);
      }
      var bool4 = item.price >= _requirements[0] &&
          item.price <= _requirements[1];
      var bool5 = item.floor >= _requirements[2] &&
          item.floor <= _requirements[3];
      var bool6 = item.roomsNo >= _requirements[4] &&
          item.roomsNo <= _requirements[5];
      var bool7 = item.bathroomsNo >= _requirements[6] &&
          item.bathroomsNo <= _requirements[7];
      var bool8 = item.area >= _requirements[8] &&
          item.area <= _requirements[9];

      if ((bool1 || bool2) &&
          bool3 &&
          bool4 &&
          bool5 &&
          bool6 &&
          bool7 &&
          bool8) {
        elements.add(item);
      }
      _filteredRealEstates = elements;
      notifyListeners();
    }
  }

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
