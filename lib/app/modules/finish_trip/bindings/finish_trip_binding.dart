import 'package:get/get.dart';

import '../controllers/finish_trip_controller.dart';

class FinishTripBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinishTripController>(
      () => FinishTripController(),
    );
  }
}
