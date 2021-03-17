import 'package:dartmazing/Components/FeedRepositoriesGroup/feed_repositories_group_view_model.dart';
import 'package:dartmazing/Models/repository.dart';

class FeedRepositoriesSectionViewModel {

  final int numberOfElements = 3;
  final List<Repository> repositories;
  
  FeedRepositoriesSectionViewModel({this.repositories});

  int get numberOfRows {
    var remainder = (repositories.length ~/ numberOfElements).toInt();
    final quotient = (repositories.length % numberOfElements);
    if (quotient > 0) remainder += 1;
    return remainder;
  }

  FeedRepositoriesGroupViewModel groupForIndex(int index) {
    final firstCell = repositories.asMap().containsKey(index) ? repositories[index] : null;
    final secondCell = repositories.asMap().containsKey(index+1) ? repositories[index+1] : null;
    final thirdCell = repositories.asMap().containsKey(index+2) ? repositories[index+2] : null;
    return FeedRepositoriesGroupViewModel(firstCell, secondCell, thirdCell);
  }

}