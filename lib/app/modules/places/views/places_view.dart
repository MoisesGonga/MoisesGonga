import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/places_controller.dart';

class PlacesView extends GetView<PlacesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlacesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PlacesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
