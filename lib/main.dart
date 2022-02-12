import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gps_contoller/dashboard.dart';
import 'package:gps_contoller/setting.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    defaultTransition: Transition.native,
    theme: ThemeData(
        fontFamily: 'iransans',
        textTheme: TextTheme(
            titleMedium: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.blueGrey.shade700))),
    getPages: [
      GetPage(name: '/', page: () => const GPSDashboard()),
      GetPage(name: '/setting', page: () => const GPSSetteingPage())
    ],
  ));
}
