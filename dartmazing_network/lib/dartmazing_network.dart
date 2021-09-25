
import 'dart:async';

import 'package:flutter/services.dart';

class DartmazingNetwork {
  static const MethodChannel _channel =
      const MethodChannel('dartmazing_network');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
