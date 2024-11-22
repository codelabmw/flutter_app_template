import 'package:get/get.dart';

import 'core/models/user.dart';
import 'core/services/app_connectivity_service.dart';
import 'core/contracts/services/authentication_service.dart';
import 'core/services/memory/memory_authentication_service.dart';
import 'core/contracts/services/connectivity_service.dart';
import 'pages/init/controllers/main_controller.dart';

/// This class serves as the applications service container.
/// It utilizes GetX dependency injection capabilities.
class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Repositories
    //...

    // Services
    Get.put<ConnectivityService>(AppConnectivityService());
    Get.put<AuthenticationService>(MemoryAuthenticationService());
    // Get.put<CloudStorageService>();

    // Controllers
    Get.put(MainController(), permanent: true);

    // Global State
    Get.put(User, builder: () => (Get.find<MainController>()).user);
  }
}
