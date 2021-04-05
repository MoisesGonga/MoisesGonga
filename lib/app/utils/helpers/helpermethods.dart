import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:wigoo_design_tips/app/data/model/address.dart';

class HelperMethods {
  static Future<bool> isConnected() async {
    //try{
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      return false;
    }
    //}catch(e){
    //print(e.toString());
    return true;
    //}
    return true;
  }
}
