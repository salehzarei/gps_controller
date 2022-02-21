import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gps_contoller/gpsController.dart';

enum GPSDialogBoxType {
  timerOnOff,
  simCardBalance,
  carStatus,
  users,
  callsms,
  setUser1,
  setUser2,
  setUser3,
  setSimCard,
  delayTime
}

class GPSDialogBox extends StatelessWidget {
  final GPSDialogBoxType? dialogType;
  const GPSDialogBox({Key? key, this.dialogType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final x = Get.put(GPSController());
    return GetX<GPSController>(
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
                              'ارسال تنظیم تایمر',
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
                              'استعلام مانده اعتبار ',
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
                      // مشاهده وضعیت خودرو
                      if (dialogType == GPSDialogBoxType.carStatus) {
                        x.isLoadinToSendMessage.value ? null : Get.back();
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              'دریافت وضعیت خودرو',
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
                      // مشاهده کاربران
                      if (dialogType == GPSDialogBoxType.users) {
                        x.isLoadinToSendMessage.value ? null : Get.back();
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              'استعلام کاربران سیستم',
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
                      // مشاهده شماره تماس گیرنده تماس و پیامک
                      if (dialogType == GPSDialogBoxType.callsms) {
                        x.isLoadinToSendMessage.value ? null : Get.back();
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              'دریافت کاربر تماس و پیامک',
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
                      // تنظیم شماره کاربر اول
                      if (dialogType == GPSDialogBoxType.setUser1) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              'تنظیم کاربر اول',
                              style: Get.textTheme.headlineMedium
                                  ?.copyWith(color: Colors.green),
                            ),
                            const Divider(),
                            const Text(
                                'لطفا تا زمان دریافت پیامک تایید منتظر بمانید'),
                            const Divider(),
                            Expanded(
                              flex: 5,
                              child: TextField(
                                controller: x.systemUser1.value,
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    contentPadding: EdgeInsets.zero,
                                    filled: true,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    hintText: "شماره تماس کاربر اول",
                                    fillColor: Colors.white70),
                                keyboardType: TextInputType.phone,
                                maxLength: 13,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: x.isLoadinToSendMessage.value
                                    ? const SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: CircularProgressIndicator(
                                            color: Colors.green),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              if (x.systemUser1.value.text
                                                      .length >=
                                                  11) {
                                                x.sendMessage(
                                                    command:
                                                        'user1#${x.systemUser1.value.text}');
                                              }
                                              x.update();
                                            },
                                            child: const Text('تغییر شماره'),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              x.sendMessage(command: 'del1');
                                            },
                                            child: const Text('حذف'),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                            const Spacer(),
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.close))
                          ],
                        );
                      }
                      // تنظیم شماره کاربر دوم
                      if (dialogType == GPSDialogBoxType.setUser2) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              'تنظیم کاربر دوم',
                              style: Get.textTheme.headlineMedium
                                  ?.copyWith(color: Colors.green),
                            ),
                            const Divider(),
                            const Text(
                                'لطفا تا زمان دریافت پیامک تایید منتظر بمانید'),
                            const Divider(),
                            Expanded(
                              flex: 5,
                              child: TextField(
                                controller: x.systemUser2.value,
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    contentPadding: EdgeInsets.zero,
                                    filled: true,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    hintText: "شماره تماس کاربر دوم",
                                    fillColor: Colors.white70),
                                keyboardType: TextInputType.phone,
                                maxLength: 13,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: x.isLoadinToSendMessage.value
                                    ? const SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: CircularProgressIndicator(
                                            color: Colors.green),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              if (x.systemUser2.value.text
                                                      .length >=
                                                  11) {
                                                x.sendMessage(
                                                    command:
                                                        'user2#${x.systemUser2.value.text}');
                                              }
                                              x.update();
                                            },
                                            child: const Text('تغییر شماره'),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              x.sendMessage(command: 'del2');
                                            },
                                            child: const Text('حذف'),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                            const Spacer(),
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.close))
                          ],
                        );
                      }
                      // تنظیم شماره کاربر سوم
                      if (dialogType == GPSDialogBoxType.setUser3) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              'تنظیم کاربر سوم',
                              style: Get.textTheme.headlineMedium
                                  ?.copyWith(color: Colors.green),
                            ),
                            const Divider(),
                            const Text(
                                'لطفا تا زمان دریافت پیامک تایید منتظر بمانید'),
                            const Divider(),
                            Expanded(
                              flex: 5,
                              child: TextField(
                                controller: x.systemUser3.value,
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    contentPadding: EdgeInsets.zero,
                                    filled: true,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    hintText: "شماره تماس کاربر سوم",
                                    fillColor: Colors.white70),
                                keyboardType: TextInputType.phone,
                                maxLength: 13,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: x.isLoadinToSendMessage.value
                                    ? const SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: CircularProgressIndicator(
                                            color: Colors.green),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              if (x.systemUser3.value.text
                                                      .length >=
                                                  11) {
                                                x.sendMessage(
                                                    command:
                                                        'user3#${x.systemUser3.value.text}');
                                              }
                                              x.update();
                                            },
                                            child: const Text('تغییر شماره'),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              x.sendMessage(command: 'del3');
                                            },
                                            child: const Text('حذف'),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                            const Spacer(),
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.close))
                          ],
                        );
                      }
                      // تنظیم شماره سیم کارت گیرنده
                      if (dialogType == GPSDialogBoxType.setSimCard) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              'تنظیم شماره سیم کارت',
                              style: Get.textTheme.headlineMedium
                                  ?.copyWith(color: Colors.green),
                            ),
                            const Divider(),
                            const Text(
                                'لطفا شماره سیم کارت دستگاه را وارد کنید'),
                            const Divider(),
                            Expanded(
                              flex: 5,
                              child: TextField(
                                controller: x.systemSimNum.value,
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    contentPadding: EdgeInsets.zero,
                                    filled: true,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    hintText: "شماره سیم کارت",
                                    fillColor: Colors.white70),
                                keyboardType: TextInputType.phone,
                                maxLength: 13,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: x.isLoadinToSendMessage.value
                                    ? const SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: CircularProgressIndicator(
                                            color: Colors.green),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              if (x.systemSimNum.value.text
                                                      .length >=
                                                  11) {
                                                x.allCongifs.value
                                                        .modemPhonNumber =
                                                    x.systemSimNum.value.text;
                                                x.allCongifs.value.save();
                                              }
                                              x.update();
                                              Get.back();
                                            },
                                            child: const Text('تغییر شماره'),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              x.systemSimNum.value.clear();
                                              x.update();
                                            },
                                            child: const Text('حذف'),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                            const Spacer(),
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.close))
                          ],
                        );
                      }
                      // تنظیم تاخیر تماس
                      if (dialogType == GPSDialogBoxType.delayTime) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              'تنظیم تاخیر تماس',
                              style: Get.textTheme.headlineMedium
                                  ?.copyWith(color: Colors.green),
                            ),
                            const Divider(),
                            const Text(
                                'لطفا تا زمان دریافت پیامک تایید منتظر بمانید'),
                            const Divider(),
                            Expanded(
                              flex: 5,
                              child: TextField(
                                controller: x.callDelayTime.value,
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    contentPadding: EdgeInsets.zero,
                                    filled: true,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    hintText:
                                        "مدت زمان تاخیر تماس را وارد کنید",
                                    fillColor: Colors.white70),
                                keyboardType: TextInputType.number,
                                maxLength: 4,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: x.isLoadinToSendMessage.value
                                  ? const SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: CircularProgressIndicator(
                                          color: Colors.green),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        if (x.callDelayTime.value.text
                                            .isNotEmpty) {
                                          x.sendMessage(
                                              command: "time#" +
                                                  x.callDelayTime.value.text);
                                        }
                                        x.update();
                                      },
                                      child: const Text('تغییر زمان تاخیر'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.close))
                          ],
                        );
                      }
                    }(),
                  ),
                ),
              ),
            ));
  }
}
