import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';

class RepositoriesListDTO {
  final List<Repository> repositories;
  final RepositoriesType type;

  RepositoriesListDTO({this.repositories, this.type});

}
