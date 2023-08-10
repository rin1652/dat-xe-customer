import 'dart:async';
import 'dart:developer';
import 'package:get/get_connect/http/src/request/request.dart';

///được gọi trước khi mỗi yêu cầu mạng được gửi đi
///và cho phép chúng ta thêm thông tin xác thực (ví dụ: token) vào yêu cầu trước khi nó được thực hiện.
FutureOr<Request> authInterceptor(request) async {
  log('request: $request');
  // final token = AppPref.accessToken;
  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

  return request;
}
