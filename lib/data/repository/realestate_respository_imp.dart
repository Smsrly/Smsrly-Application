import 'package:smsrly/data/network/api_services.dart';
import 'package:smsrly/domain/repository/realestate_repository.dart';
import 'package:smsrly/models/realestate.dart';

import '../local/local_service.dart';

class RealEstateRepositoryImp implements RealEstateRepository{
  late ApiServices _apiServices;
  late LocalService _localService;
  RealEstateRepositoryImp(LocalService localService){
    _apiServices = ApiServices();
    _localService = localService;
  }

  @override
  Future<dynamic> getRealEstates() async {
    String? token = _localService.getToken();
    print('token ==> $token');
    if(token != null){
      final res = await _apiServices.getRealEstates(token);
      if(res is List){
        return res;
      } else {
        return res;
      }
    }
    return null;
  }

  @override
  Future<String> saveRealEstate(int realEstateId) async {
    String? token = _localService.getToken();
    if(token != null){
      final res = await _apiServices.saveRealEstate(token, realEstateId);
      if(res is Map<String,dynamic>){
        return res['message'];
      }
      return res;
    }
    return 'No Token !';
  }

  @override
  Future<String> unSaveRealEstate(int realEstateId) async{
    String? token = _localService.getToken();
    if(token != null){
      final res = await _apiServices.unSaveRealEstate(token, realEstateId);
      if(res is Map<String,dynamic>){
        return res['message'];
      }
      return res;
    }
    return 'No Token !';
  }

  @override
  Future getUploadedRealEstates() async {
    String? token = _localService.getToken();
    if(token != null){
      var res = await _apiServices.getUploads(token);
      return res;
    }
    return null;
  }

}