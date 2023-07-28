import 'package:datxe/modules/booking_module/booking_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});
  final BookingViewModel bookingViewModel = Get.put(BookingViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Screen'),
      ),
      body: const BookingBody(),
    );
  }
}
