import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../booking_module.dart';

class BookingBody extends StatelessWidget {
  const BookingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<BookingViewModel>(
      builder: (bookingViewModel) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'Location choice: ${bookingViewModel.place.value!.lat} and ${bookingViewModel.place.value!.lng}'),
            ElevatedButton(
              child: const Text('Choice place'),
              onPressed: () {
                bookingViewModel.goGooglemap();
              },
            ),
          ],
        ),
      ),
    );
  }
}
