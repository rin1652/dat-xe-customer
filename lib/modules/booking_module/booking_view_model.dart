import 'package:datxe/models/models.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class BookingViewModel extends GetxController {
  var place = Rxn<Place>(Place(0, 0));
  void goGooglemap() async {
    var value = await Get.toNamed(Routes.googlemap);

    place.value = value as Place;
  }
}
