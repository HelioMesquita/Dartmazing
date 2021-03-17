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

  FeedRepositoriesSectionViewModel _toSection(NativeResponse<RepositoriesResponse> value) {
    final repositories = value.response.items.map((e) => Repository(
      name: e.name, 
      author: e.owner.login, 
      stars: e.stargazersCount, 
      imageURL: e.owner.avatarUrl)
    ).toList();

    return FeedRepositoriesSectionViewModel(repositories: repositories);
  }

}