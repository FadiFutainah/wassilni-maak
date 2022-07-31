class AppException implements Exception {
  final String _message;

  AppException(this._message) : super();

  @override
  String toString() => _message;
}

class FetchDataException extends AppException {
  FetchDataException(int statusCode) : super('اتصال ضعيف بالشبكة');
}

class InternetConnectionException extends AppException {
  InternetConnectionException() : super('لا يوجد اتصال بالشبكة');
}

class WeakInternetConnection extends AppException {
  WeakInternetConnection() : super('اتصال ضعيف بالشبكة');
}

class NotFoundException extends AppException {
  NotFoundException(int statusCode) : super('يوجد مشكلة في السيرفر');
}
