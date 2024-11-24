import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../core/models/user.dart';
import '../../../core/exceptions/base_app_exception.dart';
import '../../../core/contracts/services/authentication_service.dart';
import '../../../core/exceptions/authentication/invalid_credentials_exception.dart';
import '../../init/controllers/main_controller.dart';
import '../../../core/routing/routes.dart';
import '../../general/error_page.dart';

class SignInPageController extends GetxController {
  late final AuthenticationService _authService;
  late final MainController _mainController;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final GlobalKey<FormState> formKey;

  bool processing = false;
  String? emailErrorText;
  String? message;

  SignInPageController() {
    _authService = Get.find<AuthenticationService>();
    _mainController = Get.find<MainController>();

    emailController = TextEditingController();
    passwordController = TextEditingController();

    formKey = GlobalKey<FormState>();
  }

  Future<void> submit() async {
    _clearErrors();
    final bool validated = formKey.currentState!.validate();

    if (validated) {
      _toggleProcessing();

      try {
        await _authService.signInWithEmail(
          email: emailController.text,
          password: passwordController.text,
        );

        final User? user = await _authService.getCurrentUser();

        if (user != null) {
          _mainController.user = user;
          Get.offAllNamed(Routes.home);
        }
      } on InvalidCredentialsException catch (error) {
        emailErrorText = error.getMessage();
      } on BaseAppException catch (error) {
        Get.to(() => ErrorPage(message: error.getMessage()));
      } finally {
        _toggleProcessing();
      }
    }
  }

  Future<void> goToSignUpPage() async {
    final result = await Get.toNamed(Routes.signup);

    if (result != null) {
      message = result as String;
      update();
    }
  }

  void goToForgotPasswordPage() {
    Get.toNamed(Routes.forgotPassword);
  }

  void _toggleProcessing() {
    processing = !processing;
    update();
  }

  void _clearErrors() {
    emailErrorText = null;
    update();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
