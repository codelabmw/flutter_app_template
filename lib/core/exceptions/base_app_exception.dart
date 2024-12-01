import '../enums/exception_type.dart';

class BaseAppException implements Exception {
  late final ExceptionType _type;
  late final String _message;

  BaseAppException({ExceptionType type = ExceptionType.general, String message = 'An exception occured'}) {
    _type = type;
    _message = message;
  }

  String getMessage() {
    return _message;
  }

  ExceptionType getType() {
    return _type;
  }
}
