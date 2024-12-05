import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routing/routes.dart';
import '../../../core/contracts/services/authentication_service.dart';
import '../../../core/exceptions/authentication/verification_exception.dart';
import '../../../core/exceptions/base_app_exception.dart';
import '../../general/error_page.dart';

class VerificationPageController extends GetxController {
  late final AuthenticationService _authService;
  late final TextEditingController verificationCodeController;
  late final GlobalKey<FormState> formKey;

  bool processing = false;
  String? errorText;

  VerificationPageController() {
    _authService = Get.find<AuthenticationService>();
    verificationCodeController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  Future<void> submit() async {
    _clearErrors();
    final bool validated = formKey.currentState!.validate();

    if (validated) {
      _toggleProcessing();

      try {
        final _ = await _authService.verify(options: verificationCodeController.text);

        // ....

        Get.offAllNamed(Routes.home);
      } on VerificationException catch (error) {
        errorText = error.getMessage();
      } on BaseAppException catch (error) {
        Get.to(() => ErrorPage(message: error.getMessage()));
      } finally {
        _toggleProcessing();
      }
    }
  }

  String? validateCode(String? value) {
    if (value == null || value.length < 6) {
      return 'Verification code has 6 digits.';
    }

    return null;
  }

  void resendVerificationCode() {}

  void _toggleProcessing() {
    processing = !processing;
    update();
  }

  void _clearErrors() {
    errorText = null;
    update();
  }

  @override
  void dispose() {
    verificationCodeController.dispose();
    super.dispose();
  }
}
