import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/check_telephone_controller.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../basic_info/views/basic_info_view.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:app_driver/app/modules/home/views/home_view.dart';

class CheckTelephoneView extends GetView<CheckTelephoneController> {
  bool showSnackBar = true;
  CheckTelephoneView() {
    //  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    var checkTelephoneController = Get.put(CheckTelephoneController());
    controller.telephoneNumber = Get.arguments.toString();
    print('Telephone: ' + controller.telephoneNumber);
  }

  Duration _duration = Duration(minutes: 1);
  final slideCountDownController = GlobalKey<SlideCountdownClockState>();

  @override
  Widget build(BuildContext context) {
    //print(checkController.secretCode);
    //checkController.listenOtp();

    controller.telephoneNumber = Get.arguments.toString();
    print('Telephone recebido: ' + controller.telephoneNumber);

    return Container(
      child: SafeArea(
        top: true,
        child: Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  width: 0,
                  height: 0,
                  child: Center(
                    child: RaisedButton(
                        elevation: 0,
                        color: Colors.white,
                        child: Container(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Get.to(WelcomePage(), transition: Transition.rightToLeftWithFade);
                        }),
                  ),
                ),
              ),
              title: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: const Color(0xffffffff),
                    height: 1.1666666666666667,
                  ),
                  children: [
                    TextSpan(
                      text: 'Verificação Telefone',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              toolbarHeight: 120,
              backgroundColor: Colors.black,
              shadowColor: Colors.amber,
            ),
            body: ListView(
              children: [
                SizedBox(
                  height: 40,
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
                        /*TextSpan(
                          text: 'Verificação do telemóvel \n',
                        ),*/
                        TextSpan(
                          text: 'Digite o código de verificação',
                          style: TextStyle(
                            fontSize: 20,
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
                    padding: EdgeInsets.only(left: 15, right: 0, top: 0),
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffffffff)),
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
                          flex: 9,
                          child: PinFieldAutoFill(
                            autofocus: true,
                            decoration: UnderlineDecoration(
                              colorBuilder: FixedColorBuilder(
                                  Colors.black.withOpacity(0.9)),
                              textStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 26,
                                color: const Color(0xff303030),
                              ),
                            ),
                            codeLength: 4,
                            onCodeChanged: (val) {
                              print(val);
                            },
                            onCodeSubmitted: (value) {
                              print("Codigo Enviado:");
                              print(value);
                              Get.to(() => HomeView(),
                                  transition: Transition.leftToRight);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: FlatButton(
                              color: Colors.black,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              shape: CircleBorder(),
                              onPressed: () {
                                validateInfo();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: const Color(0xff303030),
                          ),
                          children: [
                            TextSpan(
                              text: 'Enviaremos o código dentro de ',
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),

/*
                      Expanded(
                        child:
                        GetBuilder(builder: (_){
            return CountdownTimer(
                          controller: controller.countDownTimerController,

                          widgetBuilder: (_, CurrentRemainingTime time) {
                            return   time == null ? Text('00:00') : Text(
                                'hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
                          },
                        );

                        })
                      ),
                      */
                      SlideCountdownClock(
                        key: slideCountDownController,
                        duration: _duration,
                        slideDirection: SlideDirection.Down,
                        separator: ":",
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 12),
                        onDone: () {
                          onEnd();
                        },
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  bool checkValidationCode(String code) {
    if (code.length == 4) {
      return true;
    }
    return false;
  }

  validateInfo() {
    controller.saveTelephoneNumber();
    showSnackBar = false;
    Get.offAll(() => HomeView(),
        transition: Transition.leftToRight);
  }

  void onEnd() {
    if (showSnackBar) {
      Get.snackbar("Reenviar", "Clique Aqui para reenviar.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white);
    }
  }
}
