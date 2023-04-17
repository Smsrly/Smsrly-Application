import '../../../repository/realestate_repository.dart';

class DeleteRequestUseCase{
  RealEstateRepository repository;

  DeleteRequestUseCase(this.repository);

  Future deleteRequest(int id) async {
    final res = await repository.deleteRequestOfRealEstate(id);
    print('res ==> $res');
  }

}