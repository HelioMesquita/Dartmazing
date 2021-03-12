
import 'dart:async';
import 'dart:convert';

import 'package:dartmazing_network/decodable.dart';
import 'package:dartmazing_network/request_abstract.dart';
import 'package:dartmazing_network/response_abstract.dart';
import 'package:flutter/services.dart';

class DartmazingNetwork {
  static const MethodChannel _channel = const MethodChannel('dartmazing_network');

  Future<NativeResponse<T>> execute<T extends Decodable>({RequestAbstract request, T Function() creator}) async {
    final String json = await _channel.invokeMethod('performNativeRequest', request.toJson());
    return NativeResponse<T>.fromJson(jsonDecode(json), creator);
  }

}
