import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/home_page_controller.dart';

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
