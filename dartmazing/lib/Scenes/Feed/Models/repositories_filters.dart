enum RepositoriesFilters {
  stars, updated, none
}

String getFilter(RepositoriesFilters type) {
  switch (type) {
    case RepositoriesFilters.stars:
      return "stars";
    case RepositoriesFilters.updated:
      return "updated";
    case RepositoriesFilters.none:
      return "";
  }
  return "";
}
