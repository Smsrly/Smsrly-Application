import 'package:smsrly/models/realestate.dart';
import 'package:smsrly/res/strings.dart';

import '../../../repository/realestate_repository.dart';

class GetAdsUseCase{

  RealEstateRepository realEstateRepository;
  GetAdsUseCase(this.realEstateRepository);

  Future<dynamic> getRequests() async {
    final res = await realEstateRepository.getRequestsOfUser();
    if(res is List<RealEstate>){
      return res;
    } else {
      return null;
    }
  }
  Future<dynamic> getUploads() async {
    final res = await realEstateRepository.getUploadedRealEstates();
    if(res is List<RealEstate>){
        return res;
    } else {
      return null;
    }
  }

}