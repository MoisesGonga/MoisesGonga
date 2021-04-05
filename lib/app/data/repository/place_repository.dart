import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:app_driver/app/data/model/address.dart';
import 'package:app_driver/app/data/model/place_model.dart';
import 'package:app_driver/app/data/model/direction_detail.dart';
import 'package:app_driver/app/utils/config/global_variable.dart';

class PlaceRepository extends GetConnect {
  /*
  Future<List<dynamic>>searchPlaceAutoComplete(String placeName) async{

    String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$placeKey&sessiontoken=1234567890&components=country:$countryCode';
    final response = await get(url);
    if(response.hasError){
      print("erro sem dados...");
      throw Exception(response.statusText);
    }else{
      print("dados...");
      return response.body['predictions'];
    }
  }
  */

  //https://maps.googleapis.com/maps/api/place/autocomplete/json?input=mutam&key=AIzaSyDHKCBi9DHfXKepT8wgjD0HchBj0TKYwGg&sessiontoken=1234567890&components=country:ao
  Future<List<Place>> searchPlaceAutoComplete(String placeName) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$placeKey&sessiontoken=1234567890&components=country:ao";
    final response = await get<List<Place>>(
      url,
      decoder: (response) {
        return response['predictions']
                ?.map<Place>((d) => Place(
                    d['place_id'],
                    d['description'],
                    d['structured_formatting']['main_text'],
                    d['structured_formatting']['secondary_text']))
                ?.toList() ??
            [];
      },
    );
    if (response.hasError) {
      print("erro sem dados...");
      throw Exception(response.statusText);
    } else {
      print("dados...");
      print(response.body.first.description);
      return response.body;
    }
  }

  // Convert Position to Address
  //https://maps.googleapis.com/maps/api/geocode/json?latlng=-8.814655,13.230175000000003&key=AIzaSyDHKCBi9DHfXKepT8wgjD0HchBj0TKYwGg
  Future<Address> getAddressByPosition(Position position) async {
    if (position != null) {
      double LAT = position.latitude;
      double LNG = position.latitude;
      String url =
          "https://maps.googleapis.com/maps/api/geocode/json?latlng=$LAT,$LNG&key=$placeKey";
      // "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$placeKey";
      final response = await get<Address>(
        url,
        decoder: (response) {
          printInfo(info: "info response: getAddressByPosition");
          printInfo(info: response.toString());
          Address address = Address(
              response['result'][0]['place_id'],
              response['result'][0]['formatted_address'],
              position.latitude,
              position.longitude);
          return address;
        },
      );
      if (response.hasError) {
        print("erro sem dados...");
        throw Exception(response.statusText);
      } else {
        print("dados...");
        print(response.body);
        return response.body;
      }
    }
    return null;
  }

  //https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJN1t_tDeuEmsRUsoyG83frY4&key=AIzaSyDHKCBi9DHfXKepT8wgjD0HchBj0TKYwGg
  Future<Address> getAddressPlace(String placeId) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$placeKey";
    final response = await get<Address>(
      url,
      decoder: (response) {
        Address address = Address(
            placeId,
            response['result']['name'],
            response['result']['geometry']['location']['lat'],
            response['result']['geometry']['location']['lng']);

        return address;
      },
    );
    if (response.hasError) {
      print("erro sem dados...");
      throw Exception(response.statusText);
    } else {
      print("dados...");
      print(response.body);
      return response.body;
    }
  }

  //Get routes. Origin to Destination
  //https://maps.googleapis.com/maps/api/directions/json?origin=place_id:Eh1SdWEgZGEgQ29yZWlhLCBMdWFuZGEsIEFuZ29sYSIuKiwKFAoSCf2PxOIF81EaEQ7ij7xV9dLFEhQKEgl9LI3cXPFRGhGSWsxeXBwMhQ&destination=place_id:ChIJQTdNDinyURoRhfUzAiGV5-4&mode=driving&key=AIzaSyDHKCBi9DHfXKepT8wgjD0HchBj0TKYwGg
  Future<DirectionDetail> getDirectionDetails(
      String placeIdOrigin, String placeIdDestination) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=place_id:$placeIdOrigin&destination=place_id:$placeIdDestination&mode=driving&key=$placeKey";
    final response = await get<DirectionDetail>(
      url,
      decoder: (response) {
/*
*  String distanceText;
  int distanceValeu;
  String durationText;
  int durationValeu;
  String encodedPoints;
* */

        DirectionDetail directionDetail = DirectionDetail(
            response['routes'][0]['legs'][0]['distance']['text'],
            response['routes'][0]['legs'][0]['distance']['value'],
            response['routes'][0]['legs'][0]['duration']['text'],
            response['routes'][0]['legs'][0]['duration']['value'],
            response['routes'][0]['overview_polyline']['points']);

        return directionDetail;
      },
    );
    if (response.hasError) {
      print("erro sem dados...");
      throw Exception(response.statusText);
    } else {
      print("dados...");
      print(response.body);
      return response.body;
    }
  }
}
