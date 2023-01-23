class Request{
  late int _requestId;

  int get requestId => _requestId;

  set requestId(int value) {
    _requestId = value;
  }

  late String _dateCreated;

  String get dateCreated => _dateCreated;

  set dateCreated(String value) {
    _dateCreated = value;
  }

  late String _customerId;

  String get customerId => _customerId;

  set customerId(String value) {
    _customerId = value;
  }

  late int _realEstateId;

  int get realEstateId => _realEstateId;

  set realEstateId(int value) {
    _realEstateId = value;
  }
}