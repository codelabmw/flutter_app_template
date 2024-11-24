import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/verification_page_controller.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationPageController>(
      init: VerificationPageController(),
      builder: (controller) => const Scaffold(
        body: Center(
          child: Text('Verification Page'),
        ),
      ),
    );
  }
}
