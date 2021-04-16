part of 'repositories_list_cubit.dart';

abstract class RepositoriesListState extends Equatable {

  final List<Repository> repositories;
  final RepositoriesType type;

  RepositoriesListState(this.repositories, this.type);
  

  @override
  List<Object> get props => [repositories];
}

class Loaded extends RepositoriesListState {
  
  Loaded(List<Repository> repositories, RepositoriesType type) : super(repositories, type);

}

class Loading extends RepositoriesListState {
  
  Loading(List<Repository> repositories, RepositoriesType type) : super(repositories, type);

}
