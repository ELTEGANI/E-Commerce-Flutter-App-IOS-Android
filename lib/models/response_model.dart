class ResponseModel{
  bool _isSucess;
  String _message;
  ResponseModel(this._isSucess,this._message);
  String get message => _message;
  bool get isSucess  => _isSucess;
}