import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datxe/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(Routes.booking);
          },
          child: const Text('go booking'),
        ),
      ),
    );
  }
}
