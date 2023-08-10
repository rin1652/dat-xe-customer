import 'dart:convert';

import 'package:datxe/models/models.dart';
import 'package:datxe/services/api/api.dart';
import 'package:http/http.dart';

class PlaceGoogleMapRepository extends PlaceGoogleMapApi {
  PlaceGoogleMapRepository({required String domain})
      : super(domain: ApiConstants.GOOGLE_API_URL);

  @override
  Future<Place> getPlaceByAddress(String address) async {
    address = address.replaceAll(" ", "+");
    final Response response = await getService(
        "${ApiConstants.FIND_PLACE_BY_NAME}$address${ApiConstants.KEY_GOOGLE_API}");
    final Map<String, dynamic> body = json.decode(response.body);
    double lat = body["results"][0]["geometry"]["location"]["lat"];
    double lng = body["results"][0]["geometry"]["location"]["lng"];
    Place place = Place(lat: lat, lng: lng);
    return place;
  }

  @override
  Future<String> getAddressFromLatLng(double lat, double lng) async {
    String address = "";
    final Response response = await getService(
        "${ApiConstants.FIND_PLACE_BY_LOCATION}$lat,$lng${ApiConstants.KEY_GOOGLE_API}");
    final Map<String, dynamic> body = json.decode(response.body);
    address = body["results"][0]["formatted_address"];
    return address;
  }
}
