import 'package:dartmazing/Components/FeedNewsSection/feed_news_section_view_model.dart';
import 'package:dartmazing/Components/FeedRepositoriesSection/feed_repositories_section_view_model.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_response.dart';
import 'package:dartmazing_network/native_response.dart';

class RepositoriesViewModel {
  final NativeResponse<RepositoriesResponse> stars;
  final NativeResponse<RepositoriesResponse> updated;

  RepositoriesViewModel({this.stars, this.updated});

  FeedRepositoriesSectionViewModel get starsSection => _toSection(stars);
  FeedRepositoriesSectionViewModel get updatedSection => _toSection(updated);
  
  List<Repository> get starsRepositories => _toRepositories(stars);
  List<Repository> get updatedRepositories => _toRepositories(updated);

  FeedRepositoriesSectionViewModel _toSection(NativeResponse<RepositoriesResponse> value) {
    final repositories = _toRepositories(value);
    return FeedRepositoriesSectionViewModel(repositories: repositories);
  }

  FeedNewsSectionViewModel get newsSection => FeedNewsSectionViewModel(
    starsRepositories: _toRepositories(stars),
    updatedRepositories: _toRepositories(updated));

  List<Repository> _toRepositories(NativeResponse<RepositoriesResponse> value) {
    return value.response.items.map((e) => Repository(
      name: e.name, 
      author: e.owner.login, 
      stars: e.stargazersCount, 
      imageURL: e.owner.avatarUrl,
      description: e.description,
      issues: e.openIssuesCount, 
      forks: e.forksCount,
      lastUpdate: e.updatedAt,
      )
    ).toList();

  }

}