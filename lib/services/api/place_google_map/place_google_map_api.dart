import 'package:datxe/models/models.dart';

import '../api_services.dart';

abstract class PlaceGoogleMapApi extends HttpService {
  PlaceGoogleMapApi({required super.domain});

  Future<Place> getPlaceByAddress(String address);

  Future<String> getAddressFromLatLng(double lat, double lng);
}
