import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_type.dart';

class RepositoriesListDTO {
  final List<Repository> repositories;
  final RepositoriesType type;

  RepositoriesListDTO({this.repositories, this.type});

}
