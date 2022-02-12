import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                      onPressed: () => Get.snackbar(
                          'ذخیره تنظیمات', 'با موفقیت ارسال شد',
                          backgroundColor: Colors.green.withOpacity(0.8)),
                      icon: const Icon(Icons.save))
                ],
              ),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey)),
                                            filled: true,
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            hintText: "مقدار تایمر به دقیقه ",
                                            fillColor: Colors.white70),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // item 3
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'وضعیت خودرو',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey)),
                                            filled: true,
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            hintText: "مقدار تایمر به دقیقه ",
                                            fillColor: Colors.white70),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // item 4
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
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
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey)),
                                            filled: true,
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            hintText: "مقدار تایمر به دقیقه ",
                                            fillColor: Colors.white70),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // item 5
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'تماس و پیامک',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey)),
                                            filled: true,
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            hintText: "مقدار تایمر به دقیقه ",
                                            fillColor: Colors.white70),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                      ),
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
                                        'ذخیره کاربر 1',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey)),
                                            filled: true,
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            hintText: "مقدار تایمر به دقیقه ",
                                            fillColor: Colors.white70),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
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
                                        'ذخیره کاربر 2',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey)),
                                            filled: true,
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            hintText: "مقدار تایمر به دقیقه ",
                                            fillColor: Colors.white70),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
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
                                        'ذخیره کاربر 3',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey)),
                                            filled: true,
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            hintText: "مقدار تایمر به دقیقه ",
                                            fillColor: Colors.white70),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
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
                                        'تنظیم تاخیر تماس',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey)),
                                            filled: true,
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            hintText: "مقدار تایمر به دقیقه ",
                                            fillColor: Colors.white70),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
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
                                        'پاک کردن کاربر',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey)),
                                            filled: true,
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            hintText: "مقدار تایمر به دقیقه ",
                                            fillColor: Colors.white70),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
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
