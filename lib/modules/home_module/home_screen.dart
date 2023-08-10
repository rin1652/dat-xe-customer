import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../config/constants/constants.dart';
import '../modules.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sử dụng GetX widget để lắng nghe sự thay đổi của HomeViewModel
    return GetX<HomeViewModel>(
      init: HomeViewModel(),
      builder: (homeController) => Scaffold(
        appBar: buildAppBarHomeScreen(),
        body: bookingList(homeController),
        bottomNavigationBar: goBookingButton(homeController),
      ),
    );
  }

  AppBar buildAppBarHomeScreen() {
    return AppBar(
      title: const Text('Home'),
    );
  }

  Widget bookingList(HomeViewModel homeController) {
    return Animate(
      effects: [
        SlideEffect(duration: 500.ms),
      ],
      child: Center(
          child: ListView.builder(
        itemCount: homeController.listBooking.value!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${homeController.listBooking.value![index].route.toString()} ",
              style: STYLE_MEDIUM,
            ),
            subtitle: Text(
                homeController.listBooking.value![index].price.toString(),
                style: STYLE_SMALL),
          );
        },
      )),
    );
  }

  Widget goBookingButton(HomeViewModel homeController) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          homeController.goBooking();
        },
        child: const Text('go booking'),
      ),
    );
  }
}
