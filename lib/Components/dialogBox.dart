import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gps_contoller/gpsController.dart';

enum GPSDialogBoxType { timerOnOff, simCardBalance, carStatus }

class GPSDialogBox extends StatelessWidget {
  final GPSDialogBoxType? dialogType;
  const GPSDialogBox({Key? key, this.dialogType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final x = Get.put(GPSController());
    return GetBuilder<GPSController>(
        builder: (_) => Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    width: 300,
                    height: 300,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: () {
                      // تایمر روش و خاموش
                      if (dialogType == GPSDialogBoxType.timerOnOff) {
                        x.isLoadinToSendMessage.value ? null : Get.back();
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              'تنظیم ارسال شد',
                              style: Get.textTheme.headlineMedium
                                  ?.copyWith(color: Colors.green),
                            ),
                            const Divider(),
                            const Text(
                                'لطفا تا زمان دریافت پیامک تایید منتظر بمانید'),
                            const Divider(),
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: CircularProgressIndicator(
                                    color: Colors.green),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.close))
                          ],
                        );
                      }
                      // بروزرسانی اعتبار سیم کارت
                      if (dialogType == GPSDialogBoxType.simCardBalance) {
                        x.isLoadinToSendMessage.value ? null : Get.back();
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              'استعلام اعتبار',
                              style: Get.textTheme.headlineMedium
                                  ?.copyWith(color: Colors.green),
                            ),
                            const Divider(),
                            const Text(
                                'لطفا تا زمان دریافت پیامک تایید منتظر بمانید'),
                            const Divider(),
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: CircularProgressIndicator(
                                    color: Colors.green),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.close))
                          ],
                        );
                      }
                      if (dialogType == GPSDialogBoxType.timerOnOff) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              'تنظیم ارسال شد',
                              style: Get.textTheme.headlineMedium
                                  ?.copyWith(color: Colors.green),
                            ),
                            const Divider(),
                            const Text(
                                'لطفا تا زمان دریافت پیامک تایید منتظر بمانید'),
                            const Divider(),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    filled: true,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    hintText: "مقدار تایمر به دقیقه ",
                                    fillColor: Colors.white70),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: CircularProgressIndicator(
                                    color: Colors.green),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.close))
                          ],
                        );
                      }
                      if (dialogType == GPSDialogBoxType.carStatus) {
                        return const Text("Edit");
                      }
                    }(),
                  ),
                ),
              ),
            ));
  }
}
