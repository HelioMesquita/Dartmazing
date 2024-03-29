import 'dart:async';

import 'package:dartmazing_network/request_abstract.dart';
import 'package:dartmazing_network/native_response.dart';
import 'package:flutter/services.dart';

class DartmazingNetwork {
  static const MethodChannel _channel =
      const MethodChannel('dartmazing_network');

  Future<NativeResponse<T>> execute<T>({
    required RequestAbstract request,
    required T factory(
      Map<String, dynamic> json,
    ),
  }) async {
    try {
      final response =
          await _channel.invokeMethod('performNativeRequest', request.toJson());
      final nativeResponse = Map<String, dynamic>.from(response);
      return NativeResponse<T>.fromJson(nativeResponse, factory);
    } on PlatformException catch (e) {
      return Future.error(e);
    }
  }
}
