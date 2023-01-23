class Message{
  late int _messageId;

  int get messageId => _messageId;

  set messageId(int value) {
    _messageId = value;
  }

  late String _messageType;

  String get messageType => _messageType;

  set messageType(String value) {
    _messageType = value;
  }

  late String _message;

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  late String _imageUrl;

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  late String _userId;

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  Message(this._messageId, this._messageType, this._message, this._imageUrl,
      this._userId);
}