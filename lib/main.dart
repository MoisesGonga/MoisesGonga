import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/theme/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:app_driver/app/utils/config/setting_cli.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(APP_DB);

  var box = Hive.box(APP_DB);
  bool showInitialPage = box.get(APP_WELCOME_SHOW, defaultValue: true);
  print(showInitialPage);

  runApp(
    GetMaterialApp(
      title: "Wigoo Driver",
      theme: lightTheme,
      initialRoute: showInitialPage
          ? AppPages.INITIAL
          : AppPages.routes.elementAt(0).name,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    ),
  );
}
