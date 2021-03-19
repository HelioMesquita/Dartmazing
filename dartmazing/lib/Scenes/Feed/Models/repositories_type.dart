enum RepositoriesType {
  stars, updated, none
}

String getFilter(RepositoriesType type) {
  switch (type) {
    case RepositoriesType.stars:
      return "stars";
    case RepositoriesType.updated:
      return "updated";
    case RepositoriesType.none:
      return "";
  }
  return "";
}
