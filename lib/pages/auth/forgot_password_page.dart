import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utilities/validator.dart';
import 'controllers/forgot_password_page_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordPageController>(
      init: ForgotPasswordPageController(),
      builder: (ForgotPasswordPageController pageController) => Scaffold(
        appBar: AppBar(),
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
                  'Recovery.',
                  style: context.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Get.size.height * 0.01),
                Text(
                  'Let us help you recover your account. To get started enter the email you registered with us.',
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(height: Get.size.height * 0.05),
                Form(
                  key: pageController.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: Validator.email,
                        keyboardType: TextInputType.emailAddress,
                        forceErrorText: pageController.emailTextError,
                        decoration: const InputDecoration(
                          hintText: 'Email address',
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
                              : const Text('Send Recovery Request'),
                          icon: pageController.processing
                              ? null
                              : Icon(
                                  Icons.arrow_forward_rounded,
                                  size: Get.size.width * 0.04,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
