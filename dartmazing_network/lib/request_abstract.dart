import 'package:dartmazing_network/http_verbs.dart';

abstract class RequestAbstract {
  final String scheme;
  final String host;
  final String path;
  final Map<String, String>? queryParameters;
  final Map<String, dynamic>? bodyParameters;
  final Map<String, String>? headers;
  final HttpVerbs httpVerb;

  RequestAbstract({
    required this.scheme,
    required this.host,
    required this.path,
    required this.bodyParameters,
    required this.queryParameters,
    required this.headers,
    required this.httpVerb,
  });

  Map<String, dynamic> toJson() {
    final url = Uri(
        scheme: scheme,
        host: host,
        queryParameters: queryParameters,
        path: path);

    return {
      "url": url.toString(),
      "body": bodyParameters ?? {},
      "headers": headers ?? {},
      "method": getMethod(httpVerb)
    };
  }
}
