import 'package:dartmazing/Network/base_request.dart';
import 'package:dartmazing_network/dartmazing_network.dart';
import 'package:dartmazing_network/native_response.dart';

abstract class WorkerAbstract {
  Future<NativeResponse<T>> fetch<T>({
    required BaseRequest request,
    required T factory(Map<String, dynamic> json),
  });
}

class Worker extends WorkerAbstract {
  final network = DartmazingNetwork();

  Future<NativeResponse<T>> fetch<T>(
      {required BaseRequest request,
      required T factory(Map<String, dynamic> json)}) async {
    final responseNative =
        await network.execute(request: request, factory: factory);
    return responseNative;
  }
}
