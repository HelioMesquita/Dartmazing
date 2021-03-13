class Repositories {
  List<Repository> items;

  Repositories({this.items});

  Repositories.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<Repository>();
      json['items'].forEach((v) {
        items.add(new Repository.fromJson(v));
      });
    }
  }

}

class Repository {
  String name;
  RepositoryOwner owner;
  String htmlUrl;
  String description;
  String updatedAt;
  int stargazersCount;
  int forksCount;
  int openIssuesCount;

  Repository({
      this.name,
      this.owner,
      this.htmlUrl,
      this.description,
      this.stargazersCount,
      this.forksCount,
      this.openIssuesCount,
      });

  Repository.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'] != null ? new RepositoryOwner.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    updatedAt = json['updated_at'];
    stargazersCount = json['stargazers_count'];
    forksCount = json['forks_count'];
    openIssuesCount = json['open_issues_count'];
  }  
}

class RepositoryOwner {
  String login;
  String avatarUrl;
  
  RepositoryOwner({
    this.login,
    this.avatarUrl,
  });

  RepositoryOwner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
  }
  
}

