
abstract class RealEstateRepository{
  Future<dynamic> getRealEstates();
  Future<String> saveRealEstate(int realEstateId);
  Future<String> unSaveRealEstate(int realEstateId);
  Future<String> requestRealEstate(int realEstateId);
  Future<String> deleteRealEstate(int realEstateId);
  Future<String> deleteRequestOfRealEstate(int realEstateId);
  Future<dynamic> getRequestsOfUser();
  Future<dynamic> getSavesOfUser();
  Future<dynamic> getRequestsOfRealEstate(int realEstateId);
  Future<dynamic> getUploadedRealEstates();
}