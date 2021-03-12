
import 'package:dartmazing_network/decodable.dart';

class NativeResponse<T extends Decodable> {
  final String statusCode;
  final T response;

  NativeResponse(this.statusCode, this.response);

  factory NativeResponse.fromJson(Map<String, dynamic> json, T Function() creator) {
    final statusCode = json["statusCode"];
    final response = creator().fromJson(json["response"]);
    return NativeResponse(statusCode, response);
  }
  
}
