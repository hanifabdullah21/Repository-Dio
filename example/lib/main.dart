import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repository_dio/hive/hive_helper.dart';
import 'package:repository_dio/repository/repository.dart';
import 'package:repository_dio/repository_dio.dart';

import 'app/routes/app_pages.dart';

void main() async {
  ///init Konfigurasi HIVE
  await Hive.initFlutter();
  await Hive.openBox<dynamic>(HiveHelper.hiveAppName);

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: BindingsBuilder(() {
        Get.put(Repository(baseUrl: "http://127.0.0.1:8000/"));
      }),
    ),
  );
}
