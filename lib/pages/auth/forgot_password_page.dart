import 'package:flutter/material.dart';
import 'controllers/forgot_password_page_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordPageController>(
      init: ForgotPasswordPageController(),
      builder: (controller) => const Scaffold(
        body: Center(
          child: Text('Forgot Password Page'),
        ),
      ),
    );
  }
}
