import 'package:datxe/modules/booking_module/booking_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BookingViewModel vm = Get.put(BookingViewModel());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Map'),
          onPressed: () {
            vm.goGooglemap();
          },
        ),
      ),
    );
  }
}
