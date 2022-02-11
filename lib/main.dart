import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:telephony/telephony.dart';

onBackgroundMessage(SmsMessage message) {
  debugPrint("onBackgroundMessage called");
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _message = "";
  final telephony = Telephony.instance;
  LatLng carLocation = LatLng(0.0, 0.0);
  Location location = Location();
  LocationData? currentlocation;
  bool isloadingMap = false;
  bool isloadingSend = false;
  List reciveData = [];
  String? error;
  final TextEditingController messageBox = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    getLocation();
  }

  List convert(String input) {
    List output;
    try {
      output = json.decode(input);

      return output;
    } catch (err) {
      log('The input is not a string representation of a list');
      return [];
    }
  }

  onMessage(SmsMessage message) async {
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
    setState(() {
      reciveData.clear();
      _message = message.body ?? "Error reading message body.";
      reciveData = convert(_message);
      if (reciveData.isNotEmpty && message.address == '+989933785391') {
        setState(() {
          carLocation = LatLng(reciveData[3], reciveData[4]);
        });
      }
    });
  }

  onSendStatus(SendStatus status) {
    setState(() {
      _message = status == SendStatus.SENT ? "sent" : "delivered";
    });
  }

  Future<void> getLocation() async {
    setState(() {
      isloadingMap = true;
    });
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        currentlocation = _locationResult;
        isloadingMap = false;
      });
    } on PlatformException catch (err) {
      setState(() {
        isloadingMap = true;
        error = err.code;
      });
    }
  }

  Future<void> initPlatformState() async {
    final bool? result = await telephony.requestPhoneAndSmsPermissions;
    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: onMessage, onBackgroundMessage: onBackgroundMessage);
    }
    if (!mounted) return;
  }

  Future<void> sendMessage() async {
    setState(() {
      isloadingSend = true;
    });
    final bool? result = await telephony.requestSmsPermissions;
    if (result != null && result) {
      await telephony.sendSms(to: '09933785391', message: messageBox.text);
    }
    if (reciveData.isNotEmpty) {
      setState(() {
        carLocation = LatLng(reciveData[3], reciveData[4]);
        isloadingSend = false;
      });
    }
    // print(carLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('ردیاب حسن نژاد طلا'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 500,
                  width: 400,
                  child: isloadingMap
                      ? const Center(child: CircularProgressIndicator())
                      : FlutterMap(
                          options: MapOptions(
                            center: LatLng(currentlocation!.latitude!,
                                currentlocation!.longitude!),
                            zoom: 17.0,
                          ),
                          layers: [
                            TileLayerOptions(
                              urlTemplate:
                                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                              subdomains: ['a', 'b', 'c'],
                              attributionBuilder: (_) {
                                return reciveData.isNotEmpty
                                    ? Text(
                                        'سرعت ماشین' +
                                            reciveData[2].toString() +
                                            ' کیلومتر بر ساعت',
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                      )
                                    : const Text('ماشین پیدا نشده هنوز');
                              },
                            ),
                            MarkerLayerOptions(
                              markers: [
                                Marker(
                                  width: 80.0,
                                  height: 80.0,
                                  point: LatLng(currentlocation!.latitude!,
                                      currentlocation!.longitude!),
                                  builder: (ctx) => Container(
                                    child: const Icon(
                                      Icons.person_pin,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Marker(
                                    point: carLocation,
                                    builder: (ctx) => const SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: Icon(
                                            Icons.car_rental,
                                            color: Colors.green,
                                          ),
                                        ))
                              ],
                            ),
                          ],
                        ),
                ),
                Center(child: Text("Latest received SMS: $_message")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: messageBox,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: 'متن پیام'),
                  ),
                ),
                IconButton(
                    onPressed: () => sendMessage(),
                    icon: const Icon(Icons.send)),
                const SizedBox(
                  height: 10,
                ),
                isloadingSend
                    ? const LinearProgressIndicator()
                    : const SizedBox()
              ],
            ),
          ),
        ));
  }
}
