class Place {
  String? address;
  double? lat;
  double? lng;

  Place({this.lat, this.lng, this.address});

  static Map<String, dynamic> toMap(Place place) {
    return <String, dynamic>{
      'lat': place.lat,
      'lng': place.lng,
      'address': place.address,
    };
  }

  static Place fromMap(Map<String, dynamic> map) {
    return Place(
      lat: map['lat'] as double?,
      lng: map['lng'] as double?,
      address: map['address'] as String?,
    );
  }
}
