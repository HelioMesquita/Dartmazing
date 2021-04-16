import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Models/repository_response.dart';

class RepositoriesResponse {
  List<RepositoryResponse> items;
  int totalCount;

  RepositoriesResponse({this.items});

  RepositoriesResponse.fromJson(Map<String, dynamic> json) {
    totalCount = json["total_count"];
    if (json['items'] != null) {
      items = new List<RepositoryResponse>();
      json['items'].forEach((v) {
        items.add(new RepositoryResponse.fromJson(v));
      });
    }
  }

   List<Repository> toRepositories() {
    return items.map((e) => Repository(
      name: e.name, 
      author: e.owner.login, 
      stars: e.stargazersCount, 
      imageURL: e.owner.avatarUrl,
      description: e.description,
      issues: e.openIssuesCount, 
      forks: e.forksCount,
      lastUpdate: e.updatedAt,
      )
    ).toList();
  }

}
