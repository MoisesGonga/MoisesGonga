import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_driver/app/utils/components/DrawerMenu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:app_driver/app/utils/config/setting_cli.dart';
import 'package:hive/hive.dart';
import '../controllers/home_controller.dart';
import 'package:app_driver/app/modules/finish_trip/views/finish_trip_view.dart';
import 'package:getwidget/getwidget.dart';
import 'package:app_driver/app/modules/search_place/views/search_place_view.dart';
import 'package:app_driver/app/modules/options_trip/views/options_trip_view.dart';

class HomeView extends GetView<HomeController> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode searchFocusNode = FocusNode();

  loadUserName() async {
    if (CURRENT_USER == null) {
      var hiveDB = Hive.box(APP_DB);
      CURRENT_USER = await hiveDB.get(CLI_USERNAME);
    }
  }
  //loadUserName();

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
          width: 300,
          color: Colors.white,
          child: DrawerMenu(scaffoldKey: _scaffoldKey)),
      drawerEnableOpenDragGesture: true,
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        width: 70,
        height: 60,
        child: Stack(children: [
          Center(
              child: RaisedButton(
                  elevation: 0,
                  color: Colors.black,
                  child: Center(
                    child: Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                    ),
                  ),
                  shape: CircleBorder(),
                  onPressed: () {
                    print("Text");
                  })),
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      "20",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )),
        ]),
      ),
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.only(top: 179),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: GoogleMap(
                  rotateGesturesEnabled: true,
                  // markers: Set.of(controller.markers),
                  initialCameraPosition: CameraPosition(
                    target: controller.center.value,
                    zoom: 18.0,
                  ),
                  onMapCreated: controller.onMapCreated,
                  zoomGesturesEnabled: true,
                  onCameraMove: controller.onCameraMove,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  myLocationButtonEnabled: true,
                  mapToolbarEnabled: false,
                  zoomControlsEnabled: false)),
          Positioned(
            top: 44,
            left: 15,
            right: 0,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 2),
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: RaisedButton(
                        elevation: 0,
                        color: Colors.white,
                        child: Container(
                          width: 50,
                          child: SizedBox(
                            child: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        shape: CircleBorder(),
                        onPressed: () {
                          //_scaffoldKey.currentState.openDrawer();
                          toggleDrawer();
                        }),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                        //color: const Color(0xfff4b503),
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: const Color(0xff303030),
                              height: 1.1666666666666667,
                            ),
                            children: [
                              TextSpan(
                                text: 'Ola, ',
                              ),
                              TextSpan(
                                text: '{CURRENT_USER}\n',
                                style: TextStyle(
                                  color: const Color(0xfff4b503),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: 'Aonde pretendes ir?',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),

          //Search bar

          Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: Container(
              width: 0,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xffffffff),
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
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        focusNode: searchFocusNode,
                        onTap: () async {
                          Get.to(() => SearchPlaceView());
                          searchFocusNode.unfocus();
                        },
                        enabled: true,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: const Color(0xff303030),
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                            hintText: "Digite o destino...",
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: const Color(0xff303030),
                              fontWeight: FontWeight.w700,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          //  Get.to(ChooseTaxiPage(),
                          //    transition: Transition.fadeIn);
                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: const Color(0xff707070),
                            size: 34,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  toggleDrawer() async {
    if (_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openEndDrawer();
    } else {
      _scaffoldKey.currentState.openDrawer();
    }
  }
}
