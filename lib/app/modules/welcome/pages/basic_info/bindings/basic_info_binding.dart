import 'package:get/get.dart';

import '../controllers/basic_info_controller.dart';

class WelcomeBasicInfoBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<BasicInfoController>(
      () => BasicInfoController(),
    );
  }
}
