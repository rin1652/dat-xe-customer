import 'package:get/get.dart';

import '../../routes/routes.dart';

class BookingViewModel extends GetxController {
  void goGooglemap() {
    print('bay tới map');
    Get.toNamed(Routes.googlemap);
  }
}
