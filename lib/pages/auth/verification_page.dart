import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/verification_page_controller.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationPageController>(
      init: VerificationPageController(),
      builder: (VerificationPageController pageController) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: Get.size.width,
            height: Get.size.height,
            padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  'Verification.',
                  style: context.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Get.size.height * 0.01),
                Text(
                  'Let us help you verify your account. To get started enter the verification code you got in your email.',
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(height: Get.size.height * 0.05),
                Form(
                  key: pageController.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: pageController.verificationCodeController,
                        validator: pageController.validateCode,
                        keyboardType: TextInputType.number,
                        forceErrorText: pageController.errorText,
                        decoration: const InputDecoration(
                          hintText: 'Verification code',
                        ),
                      ),
                      SizedBox(height: Get.size.height * 0.06),
                      SizedBox(
                        width: Get.size.width,
                        height: Get.size.height * 0.06,
                        child: ElevatedButton.icon(
                          onPressed: pageController.processing ? null : pageController.submit,
                          iconAlignment: IconAlignment.end,
                          label: pageController.processing
                              ? SizedBox(
                                  width: Get.size.width * 0.06,
                                  height: Get.size.width * 0.06,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : const Text('Verify Account'),
                          icon: pageController.processing
                              ? null
                              : RotationTransition(
                                  turns: const AlwaysStoppedAnimation(-(45 / 360)),
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    size: Get.size.width * 0.04,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Didn\'t receive any email?'),
                    TextButton.icon(
                      onPressed: pageController.resendVerificationCode,
                      iconAlignment: IconAlignment.end,
                      label: const Text('Resend'),
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        size: Get.size.width * 0.04,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
