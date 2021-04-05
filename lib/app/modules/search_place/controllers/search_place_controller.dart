import 'package:get/get.dart';
import 'package:app_driver/app/data/model/place_model.dart';
import 'package:meta/meta.dart';
import 'package:app_driver/app/data/repository/place_repository.dart';

import 'package:app_driver/app/data/model/address.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:app_driver/app/utils/config/setting_cli.dart';

class SearchPlaceController extends GetxController
    with StateMixin<List<Place>> {
  final PlaceRepository _placeRepository = Get.put(PlaceRepository());

  bool checkTextField = false;

  setCheckTyping(bool check) {
    checkTextField = check;
  }

  bool getCheckTyping() {
    return checkTextField;
  }

  searchPlace(String placeName) async {
    var response = await this
        ._placeRepository
        .searchPlaceAutoComplete(placeName)
        .then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      print(err);
      change(null, status: RxStatus.error("Erro ao pesquisar lugares"));
    });
  }

  setDestinationPlace(Place place) async {
    Address destinationAddress =
        await _placeRepository.getAddressPlace(place?.placeId);
    destinationAddress.mainText = place.mainText;
    destinationAddress.secondaryText = place.secondaryText;
    String result = jsonEncode(destinationAddress);
    print(result);
    DESTINATION_ADDRESS_USER = destinationAddress;
    // await savePlace(DESTINATION_PLACE,result);
  }

  setSourcePlace(Place place) async {
    Address sourceAddress =
        await _placeRepository.getAddressPlace(place?.placeId);
    sourceAddress.mainText = place.mainText;
    sourceAddress.secondaryText = place.secondaryText;
    String result = jsonEncode(sourceAddress);
    print(result);
    SOURCE_ADDRESS_USER = sourceAddress;
    //await savePlace(SOURCE_PLACE,result);
  }

  savePlace(String placeTarget, String placeData) async {
    var hiveDB = Hive.box(APP_DB);
    await hiveDB.put(placeTarget, placeData);

    printInfo(info: "Saved Data HiveDb");
    printInfo(info: "Target place: $placeTarget");
    printInfo(info: "Target data: $placeData");

    String infoSaved = await hiveDB.get(placeTarget);
    printInfo(info: "Info saved - $placeTarget: $placeData");
  }
}
