import 'package:smsrly/models/realestate.dart';

abstract class RealEstateRepository{
  Future<dynamic> getRealEstates();
}