import '../../enums/exception_type.dart';
import '../base_app_exception.dart';

class VerificationException extends BaseAppException {
  VerificationException([String message = 'Verification failed.'])
      : super(message: message, type: ExceptionType.authentication);
}
