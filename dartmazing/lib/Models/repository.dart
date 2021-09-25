class Repository {
  String name;
  String author;
  String imageURL;
  String? description;
  int stars;
  int issues;
  int forks;
  String lastUpdate;

  Repository({
    required this.name,
    required this.author,
    required this.stars,
    required this.imageURL,
    required this.description,
    required this.issues,
    required this.forks,
    required this.lastUpdate,
  });
}
