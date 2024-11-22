import 'package:flutter/material.dart';
import 'controllers/sign_up_page_controller.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpPageController>(
      init: SignUpPageController(),
      builder: (controller) => const Scaffold(
        body: Center(
          child: Text('Sign Up Page'),
        ),
      ),
    );
  }
}
