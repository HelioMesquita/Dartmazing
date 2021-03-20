import 'package:dartmazing/Components/FeedRepositoriesGroup/feed_repositories_group_view_model.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_type.dart';
import 'package:flutter/foundation.dart';

class FeedRepositoriesSectionViewModel {

  final int numberOfElements = 3;
  final List<Repository> repositories;
  final RepositoriesType type;
  
  FeedRepositoriesSectionViewModel({@required this.repositories,@required this.type});

  int get numberOfRows {
    var remainder = (repositories.length ~/ numberOfElements).toInt();
    final quotient = (repositories.length % numberOfElements);
    if (quotient > 0) remainder += 1;
    return remainder;
  }

  FeedRepositoriesGroupViewModel groupForIndex(int index) {
    final currentIndex = index * numberOfElements;
    final firstCell = repositories.asMap().containsKey(currentIndex) ? repositories[currentIndex] : null;
    final secondCell = repositories.asMap().containsKey(currentIndex+1) ? repositories[currentIndex+1] : null;
    final thirdCell = repositories.asMap().containsKey(currentIndex+2) ? repositories[currentIndex+2] : null;
    return FeedRepositoriesGroupViewModel(firstCell: firstCell,secondCell: secondCell,thirdCell: thirdCell);
  }

}