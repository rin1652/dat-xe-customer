import 'package:datxe/modules/modules.dart';

import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
        name: Routes.home,
        page: () => const HomeScreen(),
        transition: Transition.zoom),
    GetPage(
      name: Routes.booking,
      page: () => BookingScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
        name: Routes.googlemap,
        page: () => const GoogleMapScreen(),
        transition: Transition.cupertino)
  ];
}
