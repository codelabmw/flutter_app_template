import 'package:flutter/material.dart';
import 'package:flutter_app_template/pages/home/controllers/home_page_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) => const Scaffold(
        body: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
