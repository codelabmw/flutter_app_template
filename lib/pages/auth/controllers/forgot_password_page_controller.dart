import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/contracts/services/authentication_service.dart';
import '../../../core/exceptions/base_app_exception.dart';
import '../../general/error_page.dart';

class ForgotPasswordPageController extends GetxController {
  late final AuthenticationService _authService;
  late final TextEditingController emailController;
  late final GlobalKey<FormState> formKey;

  bool processing = false;
  String? emailTextError;

  ForgotPasswordPageController() {
    _authService = Get.find<AuthenticationService>();
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  Future<void> submit() async {
    _clearErrors();
    final bool validated = formKey.currentState!.validate();

    if (validated) {
      _toggleProcessing();

      try {
        final _ = await _authService.forgotPassword(
          identifier: emailController.text,
        );

        // Notify user of the result and what to do next
        // ...
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
    emailTextError = null;
    update();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
