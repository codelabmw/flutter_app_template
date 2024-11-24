import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utilities/validator.dart';
import 'controllers/sign_in_page_controller.dart';
import '../../core/constants/app_colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInPageController>(
      init: SignInPageController(),
      builder: (SignInPageController pageController) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: Get.size.width,
            height: Get.size.height,
            padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 5,
                ),
                Text(
                  'Sign In.',
                  style: context.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Get.size.height * 0.01),
                Text(
                  'Continue using our app by signing in into \nyour account.',
                  style: context.textTheme.bodyMedium,
                ),
                if (pageController.message != null) MessageBox(message: pageController.message!),
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
                      SizedBox(height: Get.size.height * 0.006),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: pageController.goToForgotPasswordPage,
                            child: const Text('Forgot password?'),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.size.height * 0.04),
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
                              : const Text('Sign In'),
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
                  flex: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton.icon(
                      onPressed: pageController.goToSignUpPage,
                      iconAlignment: IconAlignment.end,
                      label: const Text('Sign Up'),
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

class MessageBox extends StatelessWidget {
  const MessageBox({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.size.height * 0.03),
      padding: EdgeInsets.all(Get.size.width * 0.03),
      decoration: BoxDecoration(
        color: AppColors.success.withOpacity(0.1),
        border: Border.all(
          color: AppColors.success,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(Get.size.width * 0.02),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_rounded,
            color: AppColors.success,
            size: Get.size.width * 0.09,
          ),
          SizedBox(width: Get.size.width * 0.02),
          Expanded(
            child: Text(
              message,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.success,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
