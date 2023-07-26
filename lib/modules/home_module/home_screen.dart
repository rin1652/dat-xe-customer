import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel c = Get.put(HomeViewModel());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            c.goBooking();
          },
          child: const Text('go booking'),
        ),
      ),
    );
  }
}
