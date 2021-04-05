import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/options_trip_controller.dart';

class OptionsTripView extends GetView<OptionsTripController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OptionsTripView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OptionsTripView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
