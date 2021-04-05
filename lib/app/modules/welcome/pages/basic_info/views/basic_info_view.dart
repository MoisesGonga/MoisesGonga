import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/basic_info_controller.dart';
import 'package:app_driver/app/modules/home/views/home_view.dart';
import '../../../views/welcome_view.dart';
import 'package:app_driver/app/data/model/profile_model.dart';

class BasicInfoView extends GetView<BasicInfoController> {
  final TextEditingController firstNameTextEditingController =
      new TextEditingController();
  final TextEditingController lastNameTextEditingController =
      new TextEditingController();
  final TextEditingController emailTextEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(BasicInfoController());
    return Scaffold(
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
                      Get.to(() => WelcomeView(),
                          transition: Transition.rightToLeftWithFade);
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
                  text: 'Perfil',
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
                    TextSpan(
                      text: 'Digite informações básicas do perfil\n',
                    ),
                    TextSpan(
                      text: 'Informação do Perfil',
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
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nome',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: const Color(0xff303030),
                                  fontWeight: FontWeight.w500,
                                  height: 1.75,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 12, right: 12, top: 0, bottom: 5),
                                height: 47,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: const Color(0xffffffff),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xffffffff)),
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
                                      flex: 2,
                                      child: TextFormField(
                                          controller:
                                              firstNameTextEditingController,
                                          maxLines: 1,
                                          maxLength: 30,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color: const Color(0xff303030),
                                          ),
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 0),
                                              counterText: '')),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Apelido',
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xff303030),
                            fontWeight: FontWeight.w500,
                            height: 1.75,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 5),
                          height: 47,
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
                                flex: 2,
                                child: TextFormField(
                                    controller: lastNameTextEditingController,
                                    maxLines: 1,
                                    maxLength: 30,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      color: const Color(0xff303030),
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 0),
                                        counterText: '')),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xff303030),
                            fontWeight: FontWeight.w500,
                            height: 1.75,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 5),
                          height: 47,
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
                                flex: 2,
                                child: TextFormField(
                                    controller: emailTextEditingController,
                                    maxLines: 1,
                                    maxLength: 50,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      color: const Color(0xff303030),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 0),
                                        counterText: '')),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: SizedBox(
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
                        await saveInfoUser();
                        Get.offAll(HomeView(),
                            transition: Transition.leftToRight);
                      }),
                )),
          ],
        ));
  }

  saveInfoUser() async {
    //Profile(this.firstName, this.lastName, this.email, this.telephoneNumber);
    var profileData = Profile(
        firstNameTextEditingController.text,
        lastNameTextEditingController.text,
        emailTextEditingController.text,
        "");
    await controller.saveInfoUser(profileData);

    /*
    var hiveDB = Hive.box(APP_DB);
    String fullNameUser = firstNameTextEditingController.text +
        " " +
        lastNameTextEditingController.text;
    String emailUser = emailTextEditingController.text;
    //String nameUser = fullNameUser.split(" ").first();
    hiveDB.put(CLI_USERNAME, fullNameUser);
    hiveDB.put(CLI_EMAIL, emailUser);
    hiveDB.put(APP_WELCOME_SHOW, false);
    CURRENT_USER = fullNameUser;
    */
  }
}
