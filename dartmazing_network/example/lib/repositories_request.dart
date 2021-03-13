import 'package:dartmazing_network/http_verbs.dart';
import 'package:dartmazing_network_example/base_request.dart';

class RepositoriesRequest extends BaseRequest {
  
  RepositoriesRequest() : 
    super(
      "/search/repositories", 
      null,
      {
        "q": "language:dart",
        "per_page": "10",
        "page": "1"
      },
      null,
      HttpVerbs.GET
    );

}