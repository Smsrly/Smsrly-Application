import '../../../repository/realestate_repository.dart';

class UnSaveRealEstateUseCase{
  RealEstateRepository repository;

  UnSaveRealEstateUseCase(this.repository);

  Future unSave(int id) async {
    final res = await repository.unSaveRealEstate(id);
    print('res ==> $res');
  }

}