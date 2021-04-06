import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:app_driver/app/modules/search_place/controllers/search_place_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    /*Get.lazyPut<HomeController>(
      () => HomeController(),
     
    );*/
    Get.put(HomeController());
    Get.put(SearchPlaceController());
  }
}
