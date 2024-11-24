import '../../enums/exception_type.dart';
import '../base_app_exception.dart';

class UserAlreadyExistsException extends BaseAppException {
  UserAlreadyExistsException([String message = 'User with the same email already exists.'])
      : super(message: message, type: ExceptionType.authentication);
}
