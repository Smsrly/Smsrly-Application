import '../../../repository/realestate_repository.dart';

class SaveRealEstateUseCase{
  RealEstateRepository repository;

  SaveRealEstateUseCase(this.repository);

  Future save(int id) async {
    final res = await repository.saveRealEstate(id);
    print('res ==> $res');
  }

}