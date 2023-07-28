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
      body: GetX<BookingViewModel>(
        builder: (bookingViewModel) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'Local choose: ${bookingViewModel.place.value!.lat} and ${bookingViewModel.place.value!.lng}'),
              ElevatedButton(
                child: const Text('Choice place'),
                onPressed: () {
                  bookingViewModel.goGooglemap();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
