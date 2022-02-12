import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gps_contoller/dashboard.dart';
import 'package:gps_contoller/setting.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Hive/configModel.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ConfigModelAdapter());
  // await Hive.openBox<ConfigModelAdapter>('gpsConfig');

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    defaultTransition: Transition.native,
    theme: ThemeData(
        fontFamily: 'iransans',
        textTheme: TextTheme(
            titleMedium: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.blueGrey.shade700),
            headlineMedium: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey.shade700,
                fontSize: 24))),
    getPages: [
      GetPage(name: '/', page: () => const GPSDashboard()),
      GetPage(name: '/setting', page: () => const GPSSetteingPage())
    ],
  ));
}
