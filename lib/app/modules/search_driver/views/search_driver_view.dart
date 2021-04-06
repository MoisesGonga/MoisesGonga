import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_driver_controller.dart';

class SearchDriverView extends GetView<SearchDriverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchDriverView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SearchDriverView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
