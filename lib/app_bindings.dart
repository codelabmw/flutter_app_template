import 'package:get/get.dart';
import 'pages/init/controllers/main_controller.dart';

/// This class serves as the applications service container.
/// It utilizes GetX dependency injection capabilities.
class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Inject dependencies
    // ...

    Get.put(MainController(), permanent: true);
  }
}
