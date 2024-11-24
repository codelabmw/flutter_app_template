import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages/init/controllers/main_controller.dart';
import '../../models/user.dart';
import '../routes.dart';

class EnsureUserIsVerifiedMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    User? user = (Get.find<MainController>()).user;

    if (user != null && !user.verified) {
      return const RouteSettings(name: Routes.verification);
    }

    return null;
  }
}
