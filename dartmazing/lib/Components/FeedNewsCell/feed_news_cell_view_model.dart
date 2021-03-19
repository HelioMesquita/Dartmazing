import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_type.dart';

class FeedNewsCellViewModel {

  List<Repository> evenList = [];
  List<Repository> oddList = [];
  String title;
  String subtitle;
  String description;
  RepositoriesType type;

  FeedNewsCellViewModel.fromRepositories({List<Repository> repositories, String title, String subtitle, String description, RepositoriesType type}) {
    repositories.asMap().forEach((index, value) {
      if(index % 2 == 0) {
        evenList.add(value);
      } else {
        oddList.add(value);
      }
    });
    this.title = title;
    this.subtitle = subtitle;
    this.description = description;
    this.type = type;
  }

}