part of 'feed_cubit.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class Loading extends FeedState {}

class Loaded extends FeedState {
  final FeedRepositoriesViewModel viewModel;

  Loaded({required this.viewModel});

  @override
  List<Object> get props => [viewModel];
}

class Error extends FeedState {}

class PresentRepositoriesList extends FeedState {
  final List<Repository> repositories;
  final RepositoriesType type;
  final int totalItems;

  PresentRepositoriesList({
    required this.repositories,
    required this.type,
    required this.totalItems,
  });

  RepositoriesListDTO get transferObject => RepositoriesListDTO(
      repositories: repositories, type: type, totalItems: totalItems);
}
