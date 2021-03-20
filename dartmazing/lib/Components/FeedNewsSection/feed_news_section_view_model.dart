import 'package:dartmazing/Components/FeedNewsCell/feed_news_cell_view_model.dart';
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/foundation.dart';

class FeedNewsSectionViewModel {

  final List<Repository> starsRepositories;
  final List<Repository> updatedRepositories;

  FeedNewsSectionViewModel({@required this.starsRepositories, @required this.updatedRepositories});

  List<FeedNewsCellViewModel> get toList => [
    FeedNewsCellViewModel.fromRepositories(
      repositories: starsRepositories, 
      title: S.current.bestRepositories,
      subtitle: S.current.bestTools,
      description: S.current.renownedRepositories,
      type: RepositoriesType.stars
    ),
    FeedNewsCellViewModel.fromRepositories(
      repositories: updatedRepositories, 
      title: S.current.updatedRepositories,
      subtitle: S.current.mostUpdatedRepositories,
      description: S.current.theLatestUpdates,
      type: RepositoriesType.updated
    ),
  ];

}