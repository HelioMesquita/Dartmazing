class Repositories {
  List<Repository> items;

  Repositories({required this.items});

  factory Repositories.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      List<Repository> items = [];
      json['items'].forEach((v) {
        items.add(new Repository.fromJson(v));
      });
      return Repositories(items: items);
    } else {
      return Repositories(items: []);
    }
  }
}

class Repository {
  String name;
  RepositoryOwner? owner;
  String htmlUrl;
  String description;
  String updatedAt;
  int stargazersCount;
  int forksCount;
  int openIssuesCount;

  Repository(
      {required this.name,
      required this.owner,
      required this.htmlUrl,
      required this.description,
      required this.stargazersCount,
      required this.forksCount,
      required this.openIssuesCount,
      required this.updatedAt});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
        name: json['name'],
        owner: json['owner'] != null
            ? new RepositoryOwner.fromJson(json['owner'])
            : null,
        htmlUrl: json['html_url'],
        description: json['description'],
        updatedAt: json['updated_at'],
        stargazersCount: json['stargazers_count'],
        forksCount: json['forks_count'],
        openIssuesCount: json['open_issues_count']);
  }
}

class RepositoryOwner {
  String login;
  String avatarUrl;

  RepositoryOwner({
    required this.login,
    required this.avatarUrl,
  });

  factory RepositoryOwner.fromJson(Map<String, dynamic> json) {
    return RepositoryOwner(avatarUrl: json['avatar_url'], login: json['login']);
  }
}
