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
  String htmlUrl;
  String description;
  String updatedAt;
  int stargazersCount;
  int forksCount;
  int openIssuesCount;

  Repository(
      {required this.name,
      required this.htmlUrl,
      required this.description,
      required this.stargazersCount,
      required this.forksCount,
      required this.openIssuesCount,
      required this.updatedAt});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
        name: json['name'],
        htmlUrl: json['html_url'] ?? "",
        description: json['description'] ?? "",
        updatedAt: json['updated_at'],
        stargazersCount: json['stargazers_count'],
        forksCount: json['forks_count'],
        openIssuesCount: json['open_issues_count']);
  }
}
