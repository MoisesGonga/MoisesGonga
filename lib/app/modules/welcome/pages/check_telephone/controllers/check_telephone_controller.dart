import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'dart:async';
import 'package:hive/hive.dart';
import 'package:app_driver/app/utils/config/setting_cli.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class CheckTelephoneController extends GetxController {
  String _telephoneNumber;

  String get telephoneNumber => _telephoneNumber;
  set telephoneNumber(String value) => this._telephoneNumber = value;

  final secretCode = "8739";

  CountdownTimerController countDownTimerController;
  int endTime;

  @override
  void onInit() async {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    super.onInit();
    this.telephoneNumber = Get.arguments.toString();
    print("Numero Telefonic000000000");
    print(this.telephoneNumber);
    endTime = 999999999;
    countDownTimerController =
        CountdownTimerController(endTime: endTime, onEnd: onEndTime);
    countDownTimerController.start();
    listenOtp();
    print("Controller de Validação de Telefone!");
  }

  void onEndTime() {
    print("Tempo finalizado!");
  }

  void listenOtp() async {
    await SmsAutoFill().listenForCode;

    print("Waiting OTP CODEE");
  }

  saveTelephoneNumber() {
    var hiveDB = Hive.box(APP_DB);
    hiveDB.put(CLI_TELEPHONE, this.telephoneNumber);
    hiveDB.put(CLI_USERNAME, "Levi Gomes");
    hiveDB.put(CLI_EMAIL, "levi.gomes@gmail.com");
    hiveDB.put(APP_WELCOME_SHOW, false);
    printInfo(info: "Telephone number  saved!");
  }

  @override
  void onClose() {
    //Hive.close();
    super.dispose();
  }
}
