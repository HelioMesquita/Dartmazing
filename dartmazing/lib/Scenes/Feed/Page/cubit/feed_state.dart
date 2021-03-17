part of 'feed_cubit.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class Loading extends FeedState {}

class Loaded extends FeedState {
  final RepositoriesViewModel viewModel;

  Loaded({this.viewModel});
}

class Error extends FeedState {}
