import 'package:datxe/models/models.dart';
import 'package:get/get.dart';
import 'package:datxe/services/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../booking_module.dart';

class GoogleMapViewModel extends GetxController {
  final myPlace = Rxn<Place>(Place(0, 0));
  final pickedLocation = Rxn<LatLng>();

  final PlaceRepository placeRepository = PlaceRepository();
  final haveLocation = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  void getUserLocation() async {
    BookingViewModel bookingViewModel = Get.find();
    if (bookingViewModel.place.value != null) {
      myPlace.value = bookingViewModel.place.value;
      pickedLocation.value = LatLng(myPlace.value!.lat, myPlace.value!.lng);
      setHaveLocation(true);
      return;
    }
    myPlace.value = await placeRepository.getMyPlace();
    pickedLocation.value = LatLng(myPlace.value!.lat, myPlace.value!.lng);
    setHaveLocation(true);
  }

  void setHaveLocation(bool value) {
    if (haveLocation.value == value) return;
    haveLocation.value = value;
  }

  void pickPlace() {
    if (pickedLocation.value == null) {
      throw Exception('pickedLocation is null');
    }
    Place pickerPlace =
        Place(pickedLocation.value!.latitude, pickedLocation.value!.longitude);

    Get.back(result: pickerPlace);
  }
}
