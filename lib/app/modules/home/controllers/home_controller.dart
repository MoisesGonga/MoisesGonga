import 'package:app_driver/app/data/model/place_model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:app_driver/app/utils/config/setting_cli.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:app_driver/app/data/model/address.dart';
import 'package:hive/hive.dart';
import 'package:app_driver/app/utils/helpers/helpermethods.dart';

class HomeController extends GetxController {
  Rx<LatLng> center = LatLng(-8.8297143, 13.2378355).obs;
  Completer<GoogleMapController> gmapController = Completer();
  LatLng lastMapPosition;
  Position currentLocation;
  Set<Marker> markers = {};

  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polylines = {};

  final sourceAddress = Address.empty().obs;
  final destinationAddress = Address.empty().obs;

  final USER_CONNECTED = "".obs;

  @override
  void onInit() async {
    super.onInit();
    var hiveDB = Hive.box(APP_DB);
    CURRENT_USER = await hiveDB.get(CLI_USERNAME);

    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);

    // getUserLocation();
  }

  @override
  void onReady() async {
    var hiveDB = Hive.box(APP_DB);
    CURRENT_USER = await hiveDB.get(CLI_USERNAME);
  }

  searchPlace(String placeName) {
    //var response = this._placeRepository.searchPlaceAutoComplete(placeName);
    //print(response);
  }

  void onMapCreated(GoogleMapController controller) {
    try {
      if (!gmapController.isCompleted) {
        gmapController.complete(controller);
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  void onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }
}
