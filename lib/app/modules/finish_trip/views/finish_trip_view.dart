import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/finish_trip_controller.dart';

class FinishTripView extends GetView<FinishTripController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinishTripView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FinishTripView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
