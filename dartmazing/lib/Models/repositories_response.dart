import 'package:dartmazing/Models/repository_response.dart';

class RepositoriesResponse {
  List<RepositoryResponse> items;

  RepositoriesResponse({this.items});

  RepositoriesResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<RepositoryResponse>();
      json['items'].forEach((v) {
        items.add(new RepositoryResponse.fromJson(v));
      });
    }
  }

}
