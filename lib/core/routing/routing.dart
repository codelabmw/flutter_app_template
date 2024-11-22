import 'package:get/get.dart';

import 'routes.dart';
import '../../pages/init/init.dart';
import '../../pages/auth/sign_in_page.dart';
import '../../pages/auth/forgot_password_page.dart';
import '../../pages/auth/verification_page.dart';
import '../../pages/auth/sign_up_page.dart';
import '../../pages/home/home_page.dart';

abstract class Routing {
  static final List<GetPage> pages = [
    /// Initial  / Landing page
    GetPage(name: Routes.init, page: () => const Init()),

    /// Authentication pages
    GetPage(name: Routes.signup, page: () => const SignUpPage()),
    GetPage(name: Routes.signin, page: () => const SignInPage()),
    GetPage(name: Routes.verification, page: () => const VerificationPage()),
    GetPage(name: Routes.forgotPassword, page: () => const ForgotPasswordPage()),

    /// Home / App pages
    GetPage(name: Routes.home, page: () => const HomePage()),
  ];
}
