import 'package:datxe/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
