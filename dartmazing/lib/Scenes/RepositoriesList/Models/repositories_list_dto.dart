import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';

class RepositoriesListDTO {
  List<Repository> repositories;
  RepositoriesType type;
  int totalItems;

  RepositoriesListDTO(
      {required this.repositories,
      required this.type,
      required this.totalItems});
}
