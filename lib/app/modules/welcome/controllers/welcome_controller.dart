import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class WelcomeController extends GetxController {
  //TODO: Implement WelcomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  validateTelephoneNumber(String telephoneNumber) async {
    if (telephoneNumber == null) return false;

    if (telephoneNumber.trim().isNotEmpty) {
      print("Telefone validado com sucesso!");
      print(telephoneNumber);
      final signCode = await SmsAutoFill().getAppSignature;
      print(signCode);
      return true;
    }
    return false;
  }
}
