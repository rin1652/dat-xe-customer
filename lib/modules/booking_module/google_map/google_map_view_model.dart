import 'package:get/get.dart';
import 'package:datxe/services/services.dart';
import 'package:location/location.dart';

class GoogleMapViewModel extends GetxController {
  final lat = RxDouble(0);
  final lng = RxDouble(0);

  final PermissionRepository _permissionRepository = PermissionRepository();

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  void getUserLocation() async {
    Location location = Location();
    if (await _permissionRepository.requestLocation(location)) {
      throw Exception('Permission denied');
    }
    LocationData locationData = await location.getLocation();
    if (locationData.latitude == null || locationData.longitude == null) {
      throw Exception('Location not found');
    }

    lat.value = locationData.latitude!;
    lng.value = locationData.longitude!;
  }
}
