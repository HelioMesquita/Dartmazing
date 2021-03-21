part of 'feed_cubit.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class Loading extends FeedState {}

class Loaded extends FeedState {
  final FeedRepositoriesViewModel viewModel;

  Loaded({this.viewModel});

  @override
  List<Object> get props => [viewModel];
}

class Error extends FeedState {}

class PresentRepositoriesList extends FeedState {
  final List<Repository> repositories;
  final RepositoriesType type;

  PresentRepositoriesList({this.repositories, this.type});

  RepositoriesListDTO get transferObject => RepositoriesListDTO(repositories: repositories, type: type);

}
