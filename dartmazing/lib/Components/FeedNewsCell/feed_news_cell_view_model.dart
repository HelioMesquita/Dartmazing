import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';

class FeedNewsCellViewModel {
  List<Repository> evenList;
  List<Repository> oddList;
  String title;
  String subtitle;
  String description;
  RepositoriesType type;

  FeedNewsCellViewModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.type,
    required this.evenList,
    required this.oddList,
  });

  factory FeedNewsCellViewModel.fromRepositories({
    required List<Repository> repositories,
    required String title,
    required String subtitle,
    required String description,
    required RepositoriesType type,
  }) {
    List<Repository> evenList = [];
    List<Repository> oddList = [];

    repositories.asMap().forEach((index, value) {
      if (index % 2 == 0) {
        evenList.add(value);
      } else {
        oddList.add(value);
      }
    });

    return FeedNewsCellViewModel(
        title: title,
        subtitle: subtitle,
        description: description,
        type: type,
        evenList: evenList,
        oddList: oddList);
  }
}
