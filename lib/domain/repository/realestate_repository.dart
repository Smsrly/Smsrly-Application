
abstract class RealEstateRepository{
  Future<dynamic> getRealEstates();
  Future<String> saveRealEstate(int realEstateId);
  Future<String> unSaveRealEstate(int realEstateId);
  Future<dynamic> getUploadedRealEstates();
}