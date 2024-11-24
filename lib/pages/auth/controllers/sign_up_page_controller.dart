import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/contracts/services/authentication_service.dart';
import '../../../core/exceptions/authentication/user_already_exists_exception.dart';
import '../../../core/exceptions/base_app_exception.dart';
import '../../general/error_page.dart';

class SignUpPageController extends GetxController {
  late final AuthenticationService _authService;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController passwordConfirmationController;

  late final GlobalKey<FormState> formKey;

  bool processing = false;
  String? emailErrorText;

  SignUpPageController() {
    _authService = Get.find<AuthenticationService>();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();

    formKey = GlobalKey<FormState>();
  }

  Future<void> submit() async {
    _clearErrors();
    final bool validated = formKey.currentState!.validate();

    if (validated) {
      _toggleProcessing();

      try {
        final result = await _authService.signUpWithEmail(
          email: emailController.text,
          password: passwordController.text,
        );

        Get.back(result: 'Account created successfully. You can proceed with signing in.');
      } on UserAlreadyExistsException catch (error) {
        emailErrorText = error.getMessage();
      } on BaseAppException catch (error) {
        Get.to(() => ErrorPage(message: error.getMessage()));
      } finally {
        _toggleProcessing();
      }
    }
  }

  void _toggleProcessing() {
    processing = !processing;
    update();
  }

  void _clearErrors() {
    emailErrorText = null;
    update();
  }

  String? validatePasswordConfirmation(String? value) {
    if (value == null || value != passwordController.text) {
      return 'Passwords do not match.';
    }

    return null;
  }

  void goToSignIpPage() {
    Get.back();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();

    super.dispose();
  }
}
