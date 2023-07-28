import 'dart:convert';

import 'package:datxe/models/models.dart';
import 'package:datxe/services/api/api.dart';
import 'package:http/http.dart';

class PlaceGoogleMapRepository extends PlaceGoogleMapApi {
  PlaceGoogleMapRepository({required String domain})
      : super(domain: ApiConstans.GOOGLE_API_URL);

  @override
  Future<Place> getPlaceByAddress(String address) async {
    address = address.replaceAll(" ", "+");
    final Response bodyResponse = await getService(
        "${ApiConstans.FIND_PLACE_BY_NAME}$address${ApiConstans.KEY_GOOGLE_API}");
    final Map<String, dynamic> courseList = json.decode(bodyResponse.body);
    double lat = courseList["results"][0]["geometry"]["location"]["lat"];
    double lng = courseList["results"][0]["geometry"]["location"]["lng"];
    Place place = Place(lat, lng);
    return place;
  }
}
