import 'dart:developer';

import 'package:datxe/models/models.dart';
import 'package:datxe/services/api/api.dart';
import 'package:get/get.dart';

BookingRepository bookingRepository = Get.put(BookingRepository());

class BookingRepository extends BookingApi {
  String url = ApiConstants.API_BOOKING;
  @override
  Future<void> addBooking(BookingModel bookingModel) async {
    await post(url, BookingModel.toMap(bookingModel));
  }

  @override
  Future<NetworkState<List<BookingModel>>> getAllBooking(String userId) async {
    Response response = await get(url);
    log('${response.body}');

    if (response.statusCode == ApiConstants.SUCCESS) {
      final List<dynamic> bookingList = response.body;
      final List<BookingModel> list =
          bookingList.map((e) => BookingModel.fromMap(e)).toList();
      return NetworkState(
        statusCode: response.statusCode,
        data: list,
      );
    } else {
      return NetworkState.withError(response);
    }
  }

  @override
  Future<void> updateBooking(BookingModel bookingModel) {
    // TODO: implement updateBooking
    throw UnimplementedError();
  }
}
