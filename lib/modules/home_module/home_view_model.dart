import 'package:datxe/models/models.dart';
import 'package:datxe/services/api/api.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class HomeViewModel extends GetxController {
  Rxn<List<BookingModel>> listBooking = Rxn<List<BookingModel>>([]);

  void goBooking() async {
    Get.toNamed(Routes.booking);
  }

  @override
  void onInit() {
    super.onInit();

    bookingRepository.onInit();
    getListBooking();
  }

  void getListBooking() async {
    var networkState = await bookingRepository.getAllBooking('1');
    if (networkState.statusCode == ApiConstants.SUCCESS &&
        networkState.data != null) {
      listBooking.value = networkState.data!;
    } else {
      print("Lỗi get list booking");
    }
  }
}
