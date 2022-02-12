import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:universe/universe.dart';
import 'package:telephony/telephony.dart';
import 'package:location/location.dart';

class GPSController extends GetxController {
  final isFindingMyLocation = false.obs;
  final isLoadinToSendMessage = false.obs;
  final recivedSMS = ''.obs;
  final recivedDataList = [].obs;
  final gpsMapController = MapController().obs;
  final currentCarLocation = LatLng(0.0, 0.0).obs;
  final currentUserLocation = LatLng(0.0, 0.0).obs;
  final currentDistance = ''.obs;
  final carMarkers = <Marker>[].obs;
  final carPolylines = <Polyline>[].obs;
  final userToCarPolyline = <Polyline>[].obs;
  final telephony = Telephony.backgroundInstance.obs;

  // setting status
  final doorLockState = false.obs;
  final timerOnOFF = false.obs;

  onBackgroundMessage(SmsMessage message) {
    print("onBackgroundMessage called");
  }

  @override
  void onInit() {
    findMyLocation();
    initPlatformState();
    super.onInit();
  }

  // @override
  // void dispose() {
  //   gpsMapController.value.dispose();
  //   super.dispose();
  // }

  Future<void> initPlatformState() async {
    final bool? result = await telephony.value.requestPhoneAndSmsPermissions;
    if (result != null && result) {
      telephony.value.listenIncomingSms(
          onNewMessage: onMessage, listenInBackground: false);
    }
  }

  void onMessage(SmsMessage message) async {
    //Sample Format [180404,10,0,36.282047,59.565208,090222,1,1,12.5,666]
    print(message.address);
    print(message.body);
    print(message.date);
    print(message.id);
    print(message.read);
    print(message.status);
    print(message.subject);
    print(message.subscriptionId);
    print(message.threadId);
    print(message.type);

    // ignore: avoid_print
    //  print("Recive: $recivedSMS");
    //982000500666
    if (message.body!.isNotEmpty && message.address == '+989155184335') {
      recivedSMS(message.body?.trim() ?? "Error reading message body.");
      // recivedSMS(
      //     "[${(recivedSMS.value.substring(1, recivedSMS.value.length - 1)).trim()}]");

      recivedDataList(convert(recivedSMS.value));
      if (recivedDataList.isNotEmpty) {
        changeCarStatus();
      } else {
        log('No List Maked ! Check Message Format Plase');
      }
    }
    isLoadinToSendMessage(false);
    update();
  }

// Convert Recive SMS To List Of String
  List convert(String input) {
    input = "[${(input.substring(1, input.length - 1)).trim()}]";
    try {
      return input.split(',');
    } catch (err) {
      log('The input is not a string representation of a list');
      return [];
    }
  }

// Change Car New Status
  Future<void> changeCarStatus() async {
    LatLng _newCarState = LatLng(
        double.parse(recivedDataList[3]), double.parse(recivedDataList[4]));
    await Future.delayed(const Duration(milliseconds: 500));
    currentCarLocation(_newCarState);
    carMarkers.add(U.Marker(currentCarLocation.value,
        data: 'موقعیت خودرو',
        widget: const MarkerIcon(
          icon: Icons.car_repair_rounded,
          color: Colors.red,
        )));
    print("Current Car Location : $currentCarLocation");
    print("Current User Location : $currentUserLocation");
    currentDistance(U
        .distanceBetween(currentUserLocation.value, currentCarLocation.value)
        .toString());
    gpsMapController.value.move(_newCarState);
    update();
  }

  // Send Message to GPS Modem
  Future<void> sendMessage({required String command}) async {
    isLoadinToSendMessage(true);
    final bool? result = await telephony.value.requestSmsPermissions;
    if (result != null && result) {
      //09933785391
      //   await telephony.value.sendSms(to: '09933785391', message: command);
      log(command);
    }
  }

  Future findMyLocation() async {
    isFindingMyLocation(true);
    //  LatLng? location = await gpsMapController.value.locate(automove: true);
    try {
      final LocationData _locationResult = await Location().getLocation();
      currentUserLocation(
          LatLng(_locationResult.latitude, _locationResult.longitude));
      gpsMapController.value
          .move(currentUserLocation.value, animate: true, zoom: 18);
      isFindingMyLocation(false);
    } on PlatformException catch (err) {
      log(err.code);
    }
    isFindingMyLocation(false);
    update();
  }
}
