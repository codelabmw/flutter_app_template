import 'package:get/get.dart';

import '../../../core/contracts/services/authentication_service.dart';
import '../../../core/exceptions/base_app_exception.dart';
import '../../../core/models/user.dart';
import '../../../core/routing/routes.dart';
import '../../general/error_page.dart';

class MainController extends GetxController {
  late final AuthenticationService _authService;

  User? _user;

  User? get user => _user;

  set user(User? user) {
    _user = user;
    update();
  }

  MainController() {
    _authService = Get.find<AuthenticationService>();
  }

  @override
  void onInit() async {
    super.onInit();
    await _initializer();
  }

  Future<void> _initializer() async {
    try {
      String route = Routes.signin;

      user = await _authService.getCurrentUser();

      if (user != null) {
        route = Routes.home;
      }

      Get.offAllNamed(route);
    } on BaseAppException catch (exception) {
      Get.to(
        () => ErrorPage(
          message: exception.getMessage(),
          callback: () => Get.offAllNamed(Routes.init),
        ),
      );
    }
  }
}
