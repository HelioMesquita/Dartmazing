part of 'feed_cubit.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class Loading extends FeedState {}

class Loaded extends FeedState {
  final FeedRepositoriesSectionViewModel starsSection;
  final FeedRepositoriesSectionViewModel updatedSection;

  Loaded({this.starsSection, this.updatedSection});
}

class Error extends FeedState {}
