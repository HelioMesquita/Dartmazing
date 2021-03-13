
import 'package:dartmazing_network/request_abstract.dart';
import 'package:dartmazing_network/http_verbs.dart';

class BaseRequest extends RequestAbstract {

  BaseRequest(
    String path, 
    Map<String, dynamic> bodyParameters, 
    Map<String, String> queryParameters, 
    Map<String, String> headers, 
    HttpVerbs httpVerb
  ) : super(
    "https", 
    "api.github.com", 
    path, 
    bodyParameters, 
    queryParameters, 
    headers, 
    httpVerb
  );

}