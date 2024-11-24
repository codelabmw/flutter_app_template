import 'package:get/get.dart';

abstract class Validator {
  static String? email(String? value) {
    if (value == null || value.isEmpty || !value.isEmail) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty || value.length < 7) {
      return 'Password must have 7 or more charecters.';
    }

    return null;
  }

  static String? text(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field can not be empty.';
    }

    return null;
  }
}
