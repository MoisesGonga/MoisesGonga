import 'package:get/get.dart';

import '../controllers/options_trip_controller.dart';

class OptionsTripBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionsTripController>(
      () => OptionsTripController(),
    );
  }
}
