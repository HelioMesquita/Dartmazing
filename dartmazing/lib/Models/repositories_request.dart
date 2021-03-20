
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Network/base_request.dart';
import 'package:dartmazing_network/http_verbs.dart';

final String _path = "/search/repositories";
final HttpVerbs _method = HttpVerbs.GET;

class RepositoriesRequest extends BaseRequest {
  
  RepositoriesRequest(RepositoriesType type, [int page = 1, int perPage = 10]) : 
    super(
      _path, 
      null,
      {
        "q": "language:dart",
        "per_page": perPage.toString(),
        "page": page.toString(),
        "sort": getFilter(type)
      },
      null,
      _method
    );

}