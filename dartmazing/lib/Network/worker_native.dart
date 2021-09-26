import 'package:dartmazing_network/dartmazing_network.dart';
import 'package:dartmazing_network/native_response.dart';

import 'base_request.dart';
import 'worker.dart';

class WorkerNative implements Worker {
  final network = DartmazingNetwork();

  Future<NativeResponse<T>> fetch<T>(
      {required BaseRequest request,
      required T factory(Map<String, dynamic> json)}) async {
    final responseNative =
        await network.execute(request: request, factory: factory);
    return responseNative;
  }
}

Worker getWorker() => WorkerNative();
