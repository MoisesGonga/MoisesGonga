import 'package:app_driver/app/modules/home/controllers/home_controller.dart';
import 'package:app_driver/app/modules/search_place/controllers/search_place_controller.dart';
import 'package:app_driver/app/modules/options_trip/controllers/options_trip_controller.dart';
import 'package:app_driver/app/data/repository/place_repository.dart';

import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(),
    );
    Get.put(HomeController(), permanent: true);
    Get.put(SearchPlaceController(), permanent: true);
    Get.put(PlaceRepository(), permanent: true);
    Get.put(OptionsTripController());
  }
}
