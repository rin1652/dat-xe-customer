import 'package:datxe/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/constants/constants.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: normalTheme(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
