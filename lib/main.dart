import 'package:datxe/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:location/location.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}

void _getLocation() async {
  Location location = Location();

  /// kiểm tra bật định vị hay chưa
  bool serviceEnabled;

  /// kiểm tra quyền truy cập định vị
  PermissionStatus permissionGranted;

  /// lấy vị trí
  LocationData locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    /// nếu chưa bật định vị thì bật
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    /// nếu chưa có quyền truy cập định vị thì yêu cầu
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  locationData = await location.getLocation();
}
