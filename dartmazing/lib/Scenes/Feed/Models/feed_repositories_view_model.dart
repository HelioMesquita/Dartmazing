import 'package:dartmazing/Components/FeedNewsSection/feed_news_section_view_model.dart';
import 'package:dartmazing/Components/FeedRepositoriesSection/feed_repositories_section_view_model.dart';
import 'package:dartmazing/Models/repositories_response.dart';
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing_network/native_response.dart';

class FeedRepositoriesViewModel {
  final NativeResponse<RepositoriesResponse> stars;
  final NativeResponse<RepositoriesResponse> updated;
  final int starsTotalItems;
  final int updatedTotalItems;

  FeedRepositoriesViewModel(
      {required this.stars,
      required this.updated,
      required this.starsTotalItems,
      required this.updatedTotalItems});

  FeedRepositoriesSectionViewModel get starsSection =>
      _toSection(stars, RepositoriesType.stars);
  FeedRepositoriesSectionViewModel get updatedSection =>
      _toSection(updated, RepositoriesType.updated);

  List<Repository> get starsRepositories => _toRepositories(stars);
  List<Repository> get updatedRepositories => _toRepositories(updated);

  FeedRepositoriesSectionViewModel _toSection(
      NativeResponse<RepositoriesResponse> value, RepositoriesType type) {
    final repositories = _toRepositories(value);
    return FeedRepositoriesSectionViewModel(
        repositories: repositories, type: type);
  }

  FeedNewsSectionViewModel get newsSection => FeedNewsSectionViewModel(
      starsRepositories: _toRepositories(stars),
      updatedRepositories: _toRepositories(updated));

  List<Repository> _toRepositories(NativeResponse<RepositoriesResponse> value) {
    return value.response.toRepositories();
  }
}
