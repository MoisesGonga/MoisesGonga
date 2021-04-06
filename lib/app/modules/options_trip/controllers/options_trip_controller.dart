import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:app_driver/app/data/model/address.dart';
import 'package:app_driver/app/data/repository/place_repository.dart';
import 'package:hive/hive.dart';
import 'package:app_driver/app/utils/config/setting_cli.dart';
import 'package:app_driver/app/utils/helpers/helpermethods.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class OptionsTripController extends GetxController {
  final PlaceRepository _placeRepository = Get.find();
  //HomeController(this._placeRepository);

  Address sourceAddress;
  Address destinationAddress;

  Rx<LatLng> center = LatLng(-30.034399, -51.212597).obs;
  Completer<GoogleMapController> gmapController = Completer();
  LatLng lastMapPosition;
  Position currentLocation;
  Set<Marker> markers = {};
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polylines = {};

  @override
  void onInit() async {
    super.onInit();
    var hiveDB = Hive.box(APP_DB);
    CURRENT_USER.value = await hiveDB.get(CLI_USERNAME);

    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    getUserLocation();

    getDrawPlaceTrip();
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

  getUserLocation() async {
    currentLocation = await locateUser();
    center.value = LatLng(currentLocation.latitude, currentLocation.longitude);
    print('center $center');

    if (await HelperMethods.isConnected()) {
      var placeRepository = Get.find<PlaceRepository>();
      Address address =
          await placeRepository.getAddressByPosition(currentLocation);
      if (address != null) {
        printInfo(info: "Endreço encontrado: ${address.placeName}");
      }
    } else {
      printError(info: "Endreço nao encontrado:");
    }
  }

  Future<Position> locateUser() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  void setupPositionLocator() async {}

  searchPlace(String placeName) {
    /*
    var response = this._placeRepository.searchPlaceAutoComplete(placeName).then((resp){
      change(resp, status: RxStatus.success());

    }, onError: (err) {
      print(err);
      change(null, status: RxStatus.error("Erro ao pesquisar lugares"));
    });
    */

    var response = this._placeRepository.searchPlaceAutoComplete(placeName);
    print(response);
  }

  getDrawPlaceTrip() async {
    var hiveDB = await Hive.box(APP_DB);
    String sourcePlace = await hiveDB.get(SOURCE_PLACE);
    String destinationPlace = await hiveDB.get(DESTINATION_PLACE);

    sourceAddress = Address.fromJson(await json.decode(sourcePlace));
    destinationAddress = Address.fromJson(await json.decode(destinationPlace));

    printInfo(info: "Info place from source: ${sourceAddress.placeId}");
    printInfo(
        info: "Info place from destination: ${destinationAddress.placeId}");

    var _directionDetail = await _placeRepository.getDirectionDetails(
        sourceAddress.placeId, destinationAddress.placeId);

    printInfo(info: "Points: ${_directionDetail.encodedPoints}");
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result =
        polylinePoints.decodePolyline(_directionDetail.encodedPoints);

    polylineCoordinates.clear();
    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      polylines.clear();

      Polyline polyline = Polyline(
        polylineId: PolylineId('polyId'),
        color: Color.fromARGB(255, 0, 0, 0),
        points: polylineCoordinates,
        jointType: JointType.round,
        width: 4,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );

      polylines.add(polyline);
    }
  }
}
