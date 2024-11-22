enum ExceptionType {
  general('general_exception'),
  authentication('authentication_exception'),
  validation('validation_exception');

  const ExceptionType(this.value);
  final String value;

  static ExceptionType fromValue(String value) {
    return (ExceptionType.values.where((ExceptionType current) => current.value == value)).first;
  }
}
