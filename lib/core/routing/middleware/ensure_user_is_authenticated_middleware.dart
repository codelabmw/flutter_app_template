import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages/init/controllers/main_controller.dart';
import '../../models/user.dart';
import '../routes.dart';

class EnsureUserIsAuthenticatedMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final User? user = (Get.find<MainController>()).user;

    if (user == null) {
      return const RouteSettings(name: Routes.signin);
    }

    return super.redirect(route);
  }
}
