import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:app_driver/app/utils/config/setting_cli.dart';
import 'package:app_driver/app/data/model/profile_model.dart';

class BasicInfoController extends GetxController {
  saveInfoUser(Profile profile) async {
    var hiveDB = Hive.box(APP_DB);
    String fullNameUser = profile.fullName;
    String emailUser = profile.email;
    hiveDB.put(CLI_USERNAME, fullNameUser);
    hiveDB.put(CLI_EMAIL, emailUser);
    hiveDB.put(APP_WELCOME_SHOW, false);
    CURRENT_USER.value = fullNameUser;
  }
}
