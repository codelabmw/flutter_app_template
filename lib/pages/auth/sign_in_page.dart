import 'package:flutter/material.dart';
import 'controllers/sign_in_page_controller.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInPageController>(
      init: SignInPageController(),
      builder: (controller) => const Scaffold(
        body: Center(
          child: Text('Sign In Page'),
        ),
      ),
    );
  }
}
