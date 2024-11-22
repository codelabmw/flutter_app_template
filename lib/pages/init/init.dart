import 'package:flutter/material.dart';
import 'controllers/main_controller.dart';
import 'package:get/get.dart';

class Init extends StatelessWidget {
  const Init({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
