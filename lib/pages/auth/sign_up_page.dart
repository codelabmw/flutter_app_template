import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utilities/validator.dart';
import 'controllers/sign_up_page_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpPageController>(
      init: SignUpPageController(),
      builder: (SignUpPageController pageController) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            width: Get.size.width,
            height: Get.size.height * .9,
            padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  'Sign Up.',
                  style: context.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Get.size.height * 0.01),
                Text(
                  'Get started using our app by signing in into \nyour account.',
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(height: Get.size.height * 0.05),
                Form(
                  key: pageController.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: pageController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validator.email,
                        forceErrorText: pageController.emailErrorText,
                        decoration: const InputDecoration(
                          hintText: 'Email address',
                        ),
                      ),
                      SizedBox(height: Get.size.height * 0.03),
                      TextFormField(
                        obscureText: true,
                        controller: pageController.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: Validator.password,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(height: Get.size.height * 0.03),
                      TextFormField(
                        obscureText: true,
                        controller: pageController.passwordConfirmationController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: pageController.validatePasswordConfirmation,
                        decoration: const InputDecoration(
                          hintText: 'Confirm Password',
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
                              : const Text('Sign Up'),
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
                  flex: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton.icon(
                      onPressed: pageController.goToSignIpPage,
                      iconAlignment: IconAlignment.end,
                      label: const Text('Sign In'),
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        size: Get.size.width * 0.04,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
