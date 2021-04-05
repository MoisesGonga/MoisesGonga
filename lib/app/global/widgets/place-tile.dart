import 'package:flutter/material.dart';
import 'package:app_driver/app/data/model/place_model.dart';
import 'package:get/get.dart';

class PlaceTile extends GetView {
  final int index;
  final Place place;

  const PlaceTile({Key key, this.index, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      /* onTap: () {

      print(this.place.placeId);
      }
      ,
     */
      dense: true,
      visualDensity: VisualDensity(horizontal: 0, vertical: -3),
      contentPadding: index == 0
          ? EdgeInsets.only(top: 10, left: 20, right: 20)
          : EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      trailing: Icon(Icons.location_pin),
      subtitle: Text(
        this.place.secondaryText,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          color: const Color(0xff707070),
          fontWeight: FontWeight.w300,
        ),
      ),
      title: Text(
        this.place.mainText,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: const Color(0xff303030),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
