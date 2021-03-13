import 'dart:convert';

class NativeResponse<T> {
  final String statusCode;
  final T response;

  NativeResponse(this.statusCode, this.response);

  factory NativeResponse.fromJson(Map<String, dynamic> nativeResponse, T factory(Map<String, dynamic> json)) {
    final statusCode = nativeResponse["statusCode"];
    final requestResponse = jsonDecode(nativeResponse["response"]);
    final requestObject = factory(requestResponse);
    return NativeResponse(statusCode, requestObject);
  }
  
}
