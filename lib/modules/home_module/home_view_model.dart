import 'package:get/get.dart';

import '../../routes/routes.dart';

class HomeViewModel extends GetxController {
  void goBooking() async {
    Get.toNamed(Routes.booking);
  }
}
