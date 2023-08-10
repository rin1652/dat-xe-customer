import 'package:datxe/services/api/api.dart';

import '../../../models/models.dart';

abstract class BookingApi extends BaseProvider {
  Future<NetworkState<List<BookingModel>>> getAllBooking(String userId);
  Future<void> addBooking(BookingModel bookingModel);
  Future<void> updateBooking(BookingModel bookingModel);
}
