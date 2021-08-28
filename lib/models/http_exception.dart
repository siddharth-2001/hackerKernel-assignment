class HttpException implements Exception {
  final String _message;
  HttpException(this._message);

  @override
  String toString() {
    //To throw custom errors
    return _message;
  }
}