// ignore_for_file: constant_identifier_names

class ApiConstants {
  // statusCode
  static const int SUCCESS = 200;
  static const int ERROR_TOKEN = 401;
  static const int ERROR_VALIDATE = 422;
  static const int ERROR_SERVER = 500;
  static const int ERROR_DISCONNECT = -1;
  static const int NOT_FOUNT = 404;

  // google api
  static const String KEY_GOOGLE_API =
      "&key=AIzaSyAd4rEAQqf58fCJGABqW99teDP9BcuyN08";
  static const String GOOGLE_API_URL = "https://maps.googleapis.com";

  static const String FIND_PLACE_BY_NAME = "/maps/api/geocode/json?address=";
  static const String FIND_PLACE_BY_LOCATION = "/maps/api/geocode/json?latlng=";

  // data api
  static const String DOMAIN = "http://localhost:3000";
  static const String API_BOOKING = "/booking";
}
