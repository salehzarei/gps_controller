import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gps_contoller/Components/dialogBox.dart';
import 'package:gps_contoller/gpsController.dart';

class GPSSetteingPage extends StatelessWidget {
  const GPSSetteingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final x = Get.put(GPSController());
    return GetX<GPSController>(
        builder: (_) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueGrey,
                title: const Text('تنظیمات'),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () => Get.snackbar('', '',
                          colorText: Colors.white,
                          duration: const Duration(seconds: 5),
                          titleText: Text(
                            'اپلیکیشن کنترل GPS خودرو ورژن 1.0',
                            style: Get.textTheme.titleMedium
                                ?.copyWith(color: Colors.white),
                            textDirection: TextDirection.rtl,
                          ),
                          messageText: Text(
                            'طراحی و ساخت توسط حضرت مهندس امید حسن نژاد. با شب زنده داری زیاد این محصول آماده شده پس بر پدر مادر هرکسی کپی کنه لعنت !',
                            style: Get.textTheme.titleSmall
                                ?.copyWith(color: Colors.white),
                            textDirection: TextDirection.rtl,
                          ),
                          backgroundColor: Colors.purple.withOpacity(0.8)),
                      icon: const Icon(Icons.info_outline_rounded))
                ],
              ),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: ListView(
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, right: 10),
                            children: [
                              // Item1
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'تایمر روشن و خاموش',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: SwitchListTile(
                                        value: x.timerOnOFF.value,
                                        onChanged: (val) {
                                          x.timerOnOFF(val);
                                          Get.dialog(const GPSDialogBox(
                                              dialogType:
                                                  GPSDialogBoxType.timerOnOff));
                                          x.sendMessage(
                                              command: val
                                                  ? 'timer on'
                                                  : 'timer off');
                                        },
                                        title: Text(x.timerOnOFF.value
                                            ? 'روشن'
                                            : 'خاموش'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // item 2
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'میزان اعتبار',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        x.sendMessage(command: 'balance');
                                        Get.dialog(const GPSDialogBox(
                                            dialogType: GPSDialogBoxType
                                                .simCardBalance));
                                      },
                                      child: const Text('بروزرسانی'),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                            'آخرین اعتبار ${x.simCardBalance.value} ریال'))
                                  ],
                                ),
                              ),
                              // item 3
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 20, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'وضعیت خودرو',
                                            style: Get.textTheme.titleMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              x.sendMessage(command: 'status');
                                              Get.dialog(const GPSDialogBox(
                                                  dialogType: GPSDialogBoxType
                                                      .carStatus));
                                            },
                                            child: const Text(
                                                'دریافت آخرین وضعیت خودرو'),
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.end,
                                      alignment: WrapAlignment.start,
                                      children: [
                                        Text(
                                          'آخرین وضعیت دریافتی خودرو:',
                                          style: Get.textTheme.bodySmall,
                                        ),
                                        Text(x.carStatus.value)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              // item 4
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'مشاهده کاربران',
                                            style: Get.textTheme.titleMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              x.sendMessage(command: 'users?');
                                              Get.dialog(const GPSDialogBox(
                                                  dialogType:
                                                      GPSDialogBoxType.users));
                                            },
                                            child: const Text(
                                                'به روزرسانی لیست کاربران'),
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.end,
                                      alignment: WrapAlignment.start,
                                      children: [
                                        Text(
                                          'کاربران فعال:',
                                          style: Get.textTheme.bodySmall,
                                        ),
                                        Text(x.carStatus.value)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              // item 5
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'پیامک و تماس',
                                            style: Get.textTheme.titleMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              x.sendMessage(command: 'callsms');
                                              Get.dialog(const GPSDialogBox(
                                                  dialogType: GPSDialogBoxType
                                                      .callsms));
                                            },
                                            child: const Text(
                                                'استعلام گیرنده پیامک و تماس'),
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.end,
                                      alignment: WrapAlignment.start,
                                      children: [
                                        Text(
                                          'شماره گیرنده تماس و پیامک : ',
                                          style: Get.textTheme.bodySmall,
                                        ),
                                        Text(x.carStatus.value)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              // item 6
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'تنظیم کاربر 1',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                      x.systemUser1.value.text,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      textDirection: TextDirection.ltr,
                                    )),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.dialog(const GPSDialogBox(
                                            dialogType:
                                                GPSDialogBoxType.setUser1));
                                      },
                                      child: const Text('ویرایش'),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // item 7
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'تنظیم کاربر 2',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                      x.systemUser2.value.text,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      textDirection: TextDirection.ltr,
                                    )),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.dialog(const GPSDialogBox(
                                            dialogType:
                                                GPSDialogBoxType.setUser2));
                                      },
                                      child: const Text('ویرایش'),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // item 8
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'تنظیم کاربر 3',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                      x.systemUser3.value.text,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      textDirection: TextDirection.ltr,
                                    )),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.dialog(const GPSDialogBox(
                                            dialogType:
                                                GPSDialogBoxType.setUser3));
                                      },
                                      child: const Text('ویرایش'),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // item 9
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'تنظیم شماره \nسیم کارت',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                      x.systemSimNum.value.text,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      textDirection: TextDirection.ltr,
                                    )),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.dialog(const GPSDialogBox(
                                            dialogType:
                                                GPSDialogBoxType.setSimCard));
                                      },
                                      child: const Text('ویرایش'),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // item 10
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'تنظیم تاخیر تماس',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                      x.callDelayTime.value.text + ' دقیقه',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      textDirection: TextDirection.rtl,
                                    )),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.dialog(const GPSDialogBox(
                                            dialogType:
                                                GPSDialogBoxType.delayTime));
                                      },
                                      child: const Text('ویرایش'),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ));
  }
}
