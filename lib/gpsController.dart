import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gps_contoller/Hive/configModel.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

  // Hive Config
  Box<ConfigModel>? hiveConfig;

  // setting status
  final allCongifs = ConfigModel().obs;
  final doorLockState = false.obs;
  final timerOnOFF = false.obs;
  final simCardBalance = 0.0.obs;
  final carStatus = ''.obs;
  final systemUsers = ''.obs;
  final systemCallSMS = ''.obs;
  final systemUser1 = TextEditingController().obs;
  final systemUser2 = TextEditingController().obs;
  final systemUser3 = TextEditingController().obs;
  final systemSimNum = TextEditingController().obs;
  final simCardOperator = ''.obs;
  final callDelayTime = TextEditingController(text: '1').obs;

  onBackgroundMessage(SmsMessage message) {
    print("onBackgroundMessage called");
  }

  @override
  void onInit() async {
    findMyLocation();
    initPlatformState();

    hiveConfig = await Hive.openBox<ConfigModel>('gpscontroller');
    loadConfig();
    super.onInit();
  }

  @override
  void dispose() {
    gpsMapController.value.dispose();
    Hive.close();
    super.dispose();
  }

  //Save Config to Hive
  saveConfig(ConfigModel configs) {
    hiveConfig?.add(configs);
    update();
  }

  //Load Config From Hive
  loadConfig() {
    if (hiveConfig!.isNotEmpty) {
      log("Hive Object Key is:" +
          hiveConfig!.getAt(0)!.callSMSPhone.toString());
      log("Hive Object Key is:" + hiveConfig!.values.single.toString());
      allCongifs(hiveConfig?.getAt(0));
    } else {
      // add Defult Config for First Time
      hiveConfig?.add(allCongifs.value);
      log(hiveConfig!.length.toString());
    }
    update();
  }

  Future<void> initPlatformState() async {
    final bool? result = await telephony.value.requestPhoneAndSmsPermissions;
    if (result != null && result) {
      telephony.value.listenIncomingSms(
          onNewMessage: onMessage, listenInBackground: false);
    }
  }

  void onMessage(SmsMessage message) async {
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

    //982000500666
    if (message.body!.isNotEmpty &&
        message.address == allCongifs.value.modemPhonNumber) {
      recivedSMS(message.body?.trim() ?? "Error reading message body.");

      detectResponseMessage(recivedSMS.value);
    }
    isLoadinToSendMessage(false);
    update();
  }

// Convert Recive SMS To List Of String
  List convertToList(String input) {
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
        widget: const MarkerImage('assets/images/car.png')));
    log("Current Car Location : $currentCarLocation");
    log("Current User Location : $currentUserLocation");
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
      await telephony.value.sendSms(
          to: allCongifs.value.modemPhonNumber ?? '09932265621',
          message: command);
      log(command);
      Get.snackbar(
          'دستور ارسال شده به ${allCongifs.value.modemPhonNumber}', command,
          duration: const Duration(seconds: 5), backgroundColor: Colors.yellow);
    }
  }

  detectResponseMessage(String message) {
    //Sample Format [180404,10,0,36.282047,59.565208,090222,1,1,12.5,666]
    switch (message.split(":").first) {
      case 'Lock':
        {
          allCongifs.value.lockStatus = message.split(":").last;
          allCongifs.value.save();
        }
        break;
      case 'Timer':
        {
          allCongifs.value.timerStatus = message.split(":").last;
          allCongifs.value.save();
        }
        break;
      case 'Balance':
        {
          allCongifs.value.balance = message.split(":").last;
          allCongifs.value.save();
        }
        break;
      case 'Status':
        {
          allCongifs.value.lockStatus = message.split(":").last;
          allCongifs.value.save();
        }
        break;
      case 'Users':
        {
          allCongifs.value.users = message.split(":").last.split(',');
          allCongifs.value.save();
        }
        break;
      case 'Callsms':
        {
          allCongifs.value.callSMSPhone = message.split(":").last.split(',');
          allCongifs.value.save();
        }
        break;
      case 'User1':
        {
          allCongifs.value.user1Phone = message.split(":").last;
          allCongifs.value.save();
        }
        break;
      case 'User2':
        {
          allCongifs.value.user2Phone = message.split(":").last;
          allCongifs.value.save();
        }
        break;
      case 'User3':
        {
          allCongifs.value.user3Phone = message.split(":").last;
          allCongifs.value.save();
        }
        break;
      case 'Oprator':
        {
          allCongifs.value.operatorName = message.split(":").last;
          allCongifs.value.save();
        }
        break;
      case 'Interva':
        {
          allCongifs.value.delayTime = message.split(":").last;
          allCongifs.value.save();
        }
        break;
      default:
        recivedDataList(convertToList(message));
        if (recivedDataList.isNotEmpty) {
          changeCarStatus();
        } else {
          log('No List Maked ! Check Message Format Plase');
        }
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
