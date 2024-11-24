import '../../enums/exception_type.dart';
import '../base_app_exception.dart';

class InvalidCredentialsException extends BaseAppException {
  InvalidCredentialsException([String message = 'Invalid credentials.'])
      : super(message: message, type: ExceptionType.authentication);
}
