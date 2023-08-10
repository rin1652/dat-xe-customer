import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

///Hàm này được gọi sau khi nhận được phản hồi từ máy chủ và trước khi dữ liệu phản hồi được trả về cho ứng dụng.
FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  if (response.statusCode != 200) {
    handleErrorStatus(response);
    return;
  }

  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
      break;
    default:
  }

  return;
}

void responseLogger(Response response) {
  debugPrint('Status Code: ${response.statusCode}\n');
  debugPrint('Data: ${response.bodyString?.toString() ?? ''}');
}
