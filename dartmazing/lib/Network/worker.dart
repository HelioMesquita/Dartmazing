import 'package:dartmazing_network/native_response.dart';
import 'base_request.dart';

import 'worker_stub.dart'
    if (dart.library.io) 'worker_native.dart'
    if (dart.library.html) 'worker_web.dart';

abstract class Worker {
  Future<NativeResponse<T>> fetch<T>({
    required BaseRequest request,
    required T factory(Map<String, dynamic> json),
  });

  factory Worker() => getWorker();
}
