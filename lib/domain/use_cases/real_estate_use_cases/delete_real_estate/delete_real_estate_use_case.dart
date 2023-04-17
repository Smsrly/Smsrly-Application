import 'package:smsrly/domain/repository/realestate_repository.dart';

class DeleteUseCase{
  RealEstateRepository realEstateRepository;

  DeleteUseCase(this.realEstateRepository);
  Future delete(int realEstateId) async {
    var res = await realEstateRepository.deleteRealEstate(realEstateId);
    print('res ==> $res');
  }
}