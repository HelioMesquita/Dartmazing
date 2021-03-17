import 'package:dartmazing/Scenes/Feed/Models/repository_owner_response.dart';

class RepositoryResponse {
  String name;
  RepositoryOwnerResponse owner;
  String htmlUrl;
  String description;
  String updatedAt;
  int stargazersCount;
  int forksCount;
  int openIssuesCount;

  RepositoryResponse({
      this.name,
      this.owner,
      this.htmlUrl,
      this.description,
      this.stargazersCount,
      this.forksCount,
      this.openIssuesCount,
      });

  RepositoryResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'] != null ? new RepositoryOwnerResponse.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    updatedAt = json['updated_at'];
    stargazersCount = json['stargazers_count'];
    forksCount = json['forks_count'];
    openIssuesCount = json['open_issues_count'];
  }  
}