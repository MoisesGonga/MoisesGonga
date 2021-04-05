import 'package:app_driver/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(),
    );
    Get.put(HomeController());
  }
}
