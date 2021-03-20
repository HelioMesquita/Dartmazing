import 'package:dartmazing/generated/l10n.dart';

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

String getFilterTitle(RepositoriesType type) {
  switch (type) {
    case RepositoriesType.stars:
      return S.current.topRepos;
    case RepositoriesType.updated:
      return S.current.lastUpdated;
    case RepositoriesType.none:
      return "";
  }
  return "";
}