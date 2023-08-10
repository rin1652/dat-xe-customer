import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
            Animate(
              effects: [
                FadeEffect(duration: 5000.ms),
                const SlideEffect(curve: Curves.easeInOut)
              ],
              child: Text(
                  'Location choice: ${bookingViewModel.place.value!.lat} and ${bookingViewModel.place.value!.lng}'),
            ),
            ElevatedButton(
              child: const Text('Choice place'),
              onPressed: () {
                // bookingViewModel.goGooglemap();
              },
            ),
          ],
        ),
      ),
    );
  }
}
