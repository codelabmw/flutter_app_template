import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.message, this.callback});

  final String message;
  final dynamic Function()? callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Error Page'),
          ElevatedButton(
            onPressed: callback ?? () => Get.back(),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
