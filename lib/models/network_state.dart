import 'dart:developer';

import 'package:get/get.dart';

import '../services/api/api.dart';

class NetworkState<T> {
  int? statusCode;
  String? message;
  T? data;

  NetworkState({
    this.statusCode,
    this.message,
    this.data,
  });

  NetworkState.withError(Response? response) {
    String message;
    int statusCode;
    log("=========== ERROR ===========");
    if (response != null) {
      log("=========== statusCode ===========");
      log("${response.statusCode}");
      statusCode = response.statusCode!;
      log("=========== data ===========");
      log("${response.body}");
      message = "Response error";
    } else {
      statusCode = ApiConstants.ERROR_SERVER;
      log("=========== message ===========");
      message = "Không thể kết nối đến máy chủ!";
    }
    this.message = message;
    this.statusCode = statusCode;
    data = null;
  }
  NetworkState.withDisconnect() {
    log("=========== DISCONNECT ===========");
    message = "Disconnect";
    statusCode = ApiConstants.ERROR_DISCONNECT;
    data = null;
  }

  bool get isSuccess => statusCode == ApiConstants.SUCCESS;

  bool get isError => statusCode != ApiConstants.SUCCESS;
}
