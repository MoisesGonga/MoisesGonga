import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../pages/check_telephone/views/check_telephone_view.dart';
import 'package:app_driver/app/utils/components/MyClipper.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  final TextEditingController telephoneNumberTextEditingController =
      new TextEditingController();
  PhoneNumber telephoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Padding(
                    padding: EdgeInsets.only(top: 70, bottom: 110),
                    child: SvgPicture.asset(
                      "assets/images/logo-wigoo-oficial.svg",
                      semanticsLabel: "WiGoo Driver",
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xff303030),
                ),
                children: [
                  TextSpan(
                    text: 'Ola, driver!\n',
                  ),
                  TextSpan(
                    text: 'Vamos iniciar!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 0),
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xffffffff)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x33303030),
                    offset: Offset(0, 5),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: InternationalPhoneNumberInput(
                      textFieldController: telephoneNumberTextEditingController,
                      initialValue: PhoneNumber(isoCode: "AO"),
                      maxLength: 11,
                      formatInput: true,
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          letterSpacing: 1.5),
                      locale: "PT-br",
                      hintText: "Nº do telemóvel",
                      onInputChanged: (PhoneNumber number) {
                        if (number.phoneNumber.length == 13) {
                          this.telephoneNumber = number;
                          print("New true Value number");
                          print(number.phoneNumber);
                        }
                      },
                      selectorConfig: SelectorConfig(
                        useEmoji: true,
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 53,
            height: 53,
            child: RaisedButton(
                elevation: 5,
                color: Colors.black,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                shape: CircleBorder(),
                onPressed: () async {
                  bool checkValue = await controller.validateTelephoneNumber(
                      this.telephoneNumber?.phoneNumber);
                  print("Check Telephone:");
                  print(this.telephoneNumber?.phoneNumber);
                  print("$checkValue");

                  if (checkValue) {
                    Get.to(() => CheckTelephoneView(),
                        transition: Transition.leftToRight,
                        arguments: this.telephoneNumber?.phoneNumber);
                    print("Validacao: True");
                    print("Check Telephone:");
                    print(this.telephoneNumber?.phoneNumber);
                  } else {
                    print("Validacao: False");
                  }
                }),
          ),
          SizedBox(
            height: 15,
          ),
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 12,
                color: const Color(0xff303030),
              ),
              children: [
                TextSpan(
                  text: 'Criando uma conta, você concorda com os nossos \n',
                ),
                TextSpan(
                  text: 'Termos e Condições',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: ' e ',
                ),
                TextSpan(
                  text: 'Política de Privacidade',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: '.',
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
