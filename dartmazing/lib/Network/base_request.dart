import 'package:dartmazing_network/http_verbs.dart';
import 'package:dartmazing_network/request_abstract.dart';

const String _scheme = "https";
const String _host = "api.github.com";

class BaseRequest extends RequestAbstract {
  BaseRequest(
      String path,
      Map<String, dynamic>? bodyParameters,
      Map<String, String>? queryParameters,
      Map<String, String>? headers,
      HttpVerbs httpVerb)
      : super(
          scheme: _scheme,
          host: _host,
          path: path,
          bodyParameters: bodyParameters,
          queryParameters: queryParameters,
          headers: headers,
          httpVerb: httpVerb,
        );
}
