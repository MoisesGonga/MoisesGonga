import 'package:get/get.dart';

import '../controllers/check_telephone_controller.dart';

class CheckTelephoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckTelephoneController>(
      () => CheckTelephoneController(),
    );
  }
}
