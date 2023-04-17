import '../../../repository/realestate_repository.dart';

class RequestUseCase{
  RealEstateRepository repository;

  RequestUseCase(this.repository);

  Future request(int id) async {
    final res = await repository.requestRealEstate(id);
    print('res ==> $res');
  }

}