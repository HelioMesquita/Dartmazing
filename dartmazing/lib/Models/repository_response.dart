import 'package:dartmazing/Models/repository_owner_response.dart';

class RepositoryResponse {
  String name;
  RepositoryOwnerResponse owner;
  String htmlUrl;
  String? description;
  String updatedAt;
  int stargazersCount;
  int forksCount;
  int openIssuesCount;

  RepositoryResponse({
    required this.name,
    required this.owner,
    required this.htmlUrl,
    required this.description,
    required this.stargazersCount,
    required this.forksCount,
    required this.openIssuesCount,
    required this.updatedAt,
  });

  factory RepositoryResponse.fromJson(Map<String, dynamic> json) {
    return RepositoryResponse(
      name: json['name'],
      owner: RepositoryOwnerResponse.fromJson(json['owner']),
      htmlUrl: json['html_url'],
      description: json['description'],
      updatedAt: json['updated_at'],
      stargazersCount: json['stargazers_count'],
      forksCount: json['forks_count'],
      openIssuesCount: json['open_issues_count'],
    );
  }
}
