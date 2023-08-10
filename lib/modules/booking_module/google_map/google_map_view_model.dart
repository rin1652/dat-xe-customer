import 'package:datxe/models/models.dart';
import 'package:get/get.dart';
import 'package:datxe/services/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../modules.dart';

class GoogleMapViewModel extends GetxController {
  final myPlace = Rxn<Place>(Place(lat: 16.4593206, lng: 107.5914821));
  final pickedLocation = Rxn<LatLng>();

  final PlaceRepository placeRepository = PlaceRepository();
  final PlaceGoogleMapRepository placeGoogleMapRepository =
      PlaceGoogleMapRepository(domain: ApiConstants.GOOGLE_API_URL);
  final haveLocation = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  void getUserLocation() async {
    BookingViewModel bookingViewModel = Get.find();
    if (bookingViewModel.place.value != null &&
        bookingViewModel.place.value!.lat != 0 &&
        bookingViewModel.place.value!.lng != 0) {
      myPlace.value = bookingViewModel.place.value;
      pickedLocation.value = LatLng(myPlace.value!.lat!, myPlace.value!.lng!);
    } else {
      myPlace.value = await placeRepository.getMyPlace();
      pickedLocation.value = LatLng(myPlace.value!.lat!, myPlace.value!.lng!);
    }

    setHaveLocation(true);
  }

  void setHaveLocation(bool value) {
    if (haveLocation.value == value) return;
    haveLocation.value = value;
  }

  void pickPlace() async {
    if (pickedLocation.value == null) {
      throw Exception('pickedLocation is null');
    }

    String address = await placeGoogleMapRepository.getAddressFromLatLng(
        pickedLocation.value!.latitude, pickedLocation.value!.longitude);
    Place pickerPlace = Place(
        address: address,
        lat: pickedLocation.value!.latitude,
        lng: pickedLocation.value!.longitude);

    Get.back(result: pickerPlace);
  }
}
