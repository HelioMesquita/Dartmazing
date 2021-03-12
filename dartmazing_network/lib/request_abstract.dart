import 'package:dartmazing_network/http_verbs.dart';

abstract class RequestAbstract {
  final String scheme;
  final String host;
  final String path;
  final Map<String, String> queryParameters;
  final Map<String, dynamic> bodyParameters; 
  final Map<String, String> headers; 
  final HttpVerbs httpVerb;

  RequestAbstract(this.scheme, this.host, this.path, this.bodyParameters, this.queryParameters, this.headers, this.httpVerb);

  Map<String, dynamic> toJson() {
    final url = Uri(scheme: scheme, host: host, queryParameters: queryParameters, path: path);

    return { 
      "url": url.toString(),
      "body": bodyParameters ?? {},
      "headers": headers ?? {},
      "method": getMethod(httpVerb)
    };
  }

}
