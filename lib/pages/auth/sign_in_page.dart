import 'package:flutter/material.dart';
import 'controllers/sign_in_page_controller.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInPageController>(
      init: SignInPageController(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: Get.size.width,
            height: Get.size.height,
            padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                SizedBox(height: Get.size.height * 0.05),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email address',
                        ),
                      ),
                      SizedBox(height: Get.size.height * 0.03),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(height: Get.size.height * 0.006),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Forgot password?'),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.size.height * 0.04),
                      SizedBox(
                        width: Get.size.width,
                        height: Get.size.height * 0.06,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          iconAlignment: IconAlignment.end,
                          label: const Text('Sign in'),
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            size: Get.size.width * 0.04,
                          ),
                        ),
                      ),
                      SizedBox(height: Get.size.height * 0.01),
                      TextButton.icon(
                        onPressed: () {},
                        iconAlignment: IconAlignment.end,
                        label: const Text('Sign Up'),
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          size: Get.size.width * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
