import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Models/repository_response.dart';

class RepositoriesResponse {
  final List<RepositoryResponse> items;
  final int totalCount;

  RepositoriesResponse({
    required this.items,
    required this.totalCount,
  });

  factory RepositoriesResponse.fromJson(Map<String, dynamic> json) {
    final totalCount = json["total_count"];
    if (json['items'] != null) {
      List<RepositoryResponse> items = [];
      json['items'].forEach((v) {
        items.add(new RepositoryResponse.fromJson(v));
      });
      return RepositoriesResponse(items: items, totalCount: totalCount);
    }
    return RepositoriesResponse(items: [], totalCount: totalCount);
  }

  List<Repository> toRepositories() {
    return items
        .map((e) => Repository(
              name: e.name,
              author: e.owner.login,
              stars: e.stargazersCount,
              imageURL: e.owner.avatarUrl,
              description: e.description,
              issues: e.openIssuesCount,
              forks: e.forksCount,
              lastUpdate: e.updatedAt,
            ))
        .toList();
  }
}
