import 'package:datxe/models/place.dart';
import 'package:datxe/services/permission/permission.dart';
import 'package:location/location.dart';

final PermissionRepository _permissionRepository = PermissionRepository();

class PlaceRepository {
  Future<Place> getMyPlace() async {
    Location location = Location();
    if (!await _permissionRepository.requestLocation(location)) {
      throw Exception('Permission denied');
    }
    LocationData locationData = await location.getLocation();
    if (locationData.latitude == null || locationData.longitude == null) {
      throw Exception('Location not found');
    }

    return Place(locationData.latitude!, locationData.longitude!);
  }
}
