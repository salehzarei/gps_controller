import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gps_contoller/gpsController.dart';
import 'package:gps_contoller/setting.dart';
import 'package:universe/universe.dart';

class GPSDashboard extends StatelessWidget {
  const GPSDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final x = Get.put(GPSController());
    final _mapKey = UniqueKey();
    return GetX<GPSController>(
        dispose: (_) {
          x.gpsMapController.value.dispose();
        },
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('داشبورد'),
              centerTitle: true,
              backgroundColor: Colors.blueGrey,
              actions: [
                IconButton(
                    onPressed: () => Get.to(const GPSSetteingPage()),
                    icon: const Icon(Icons.settings))
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.height * 0.1,
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    runAlignment: WrapAlignment.center,
                    spacing: 5,
                    textDirection: TextDirection.rtl,
                    children: [
                      ElevatedButton(
                        onPressed: x.doorLockState.value
                            ? () {
                                x.doorLockState.toggle();
                              }
                            : null,
                        child: const Text('بــاز'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: Image.asset(
                          x.doorLockState.value
                              ? 'assets/images/padlock.png'
                              : 'assets/images/unlocked.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: !x.doorLockState.value
                            ? () {
                                x.doorLockState.toggle();
                              }
                            : null,
                        child: const Text('قفل'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: x.isFindingMyLocation.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : U.OpenStreetMap(
                          key: _mapKey,
                          controller: x.gpsMapController.value,
                          center: x.currentUserLocation.value,
                          type: OpenStreetMapType.Mapnik,
                          zoom: 17,
                          // live: true,
                          // moveWhenLive: false,
                          // showCenterMarker: true,
                          size: Size(Get.width, Get.height * 0.59),
                          markers: U.MarkerLayer(x.carMarkers)),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: Get.width,
                    child: Column(
                      children: [
                        Opacity(
                          opacity: x.isLoadinToSendMessage.value ? 0.5 : 1,
                          child: IgnorePointer(
                            ignoring: x.isLoadinToSendMessage.value,
                            child: Wrap(
                              textDirection: TextDirection.rtl,
                              alignment: WrapAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // x.recivedSMS(
                                    //     '[180404,10,0,36.282047,59.565280,090222,1,1,12.5,666]');
                                    // x.recivedDataList(x.convert(
                                    //     "[${(x.recivedSMS.value.substring(1, x.recivedSMS.value.length - 1)).trim()}]"));
                                    x.sendMessage(command: 'gps');
                                    //  x.changeCarStatus();
                                  },
                                  child: const Text('مشاهده موقعیت خودرو'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('توقف بررسی'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(x.recivedSMS.value),
                        Visibility(
                          visible: x.currentDistance.isNotEmpty,
                          child: Text(
                              'فاصله شما با خودروتان : ${x.currentDistance} متر است'),
                        ),
                        Visibility(
                            visible: x.isLoadinToSendMessage.value,
                            child: const LinearProgressIndicator())
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
