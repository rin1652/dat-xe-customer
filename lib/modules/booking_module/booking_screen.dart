import 'package:datxe/models/models.dart';
import 'package:datxe/modules/booking_module/booking_module.dart';
import 'package:datxe/shared/utils/utils.dart';
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
      body: FormBooking(),
    );
  }

  Widget addBookingButton() {
    return ElevatedButton(
      onPressed: () {
        bookingViewModel.addBooking(BookingModel(
          userId: "6",
          idRoute: "1",
          vehicle: Vehicles.SEVEN_SEATS,
          createAt: "2018-05-24T08:47:01.307Z",
          numberOfPeople: 4,
          route: "Nha Trang - Huế",
          pickUp: [
            Place(address: "Nha Trang", lat: 12.2387911, lng: 109.1967486),
            Place(address: "Khánh Hoà", lat: 12.2387911, lng: 109.1967486)
          ],
          putDown:
              Place(address: "Khánh Hoà", lat: 12.2387911, lng: 109.1967486),
          price: 100000,
          status: StatusBooking.WAITING,
        ));
      },
      child: const Text('Add Booking'),
    );
  }
}
