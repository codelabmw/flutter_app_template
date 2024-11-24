import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/constants/app_assets.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.message, this.callback});

  final String message;
  final dynamic Function()? callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.size.width,
        height: Get.size.height,
        padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              child: SvgPicture.asset(AppAssets.errorSVG),
            ),
            Text(message),
            SizedBox(height: Get.size.height * 0.04),
            SizedBox(
              width: Get.size.width,
              height: Get.size.height * 0.06,
              child: ElevatedButton.icon(
                onPressed: callback ?? () => Get.back(),
                label: const Text('Try Again'),
                icon: Icon(
                  Icons.refresh_rounded,
                  size: Get.size.width * 0.05,
                ),
              ),
            ),
            const Spacer(flex: 3),
            RichText(
              text: TextSpan(
                text: 'If you keep seeing this error you can report it.\nContact us ',
                children: [
                  TextSpan(
                    text: 'here.',
                    style: TextStyle(color: context.theme.colorScheme.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO: Handle what happens
                        // ....
                      },
                  ),
                ],
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: Get.size.width * 0.029,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Get.size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
