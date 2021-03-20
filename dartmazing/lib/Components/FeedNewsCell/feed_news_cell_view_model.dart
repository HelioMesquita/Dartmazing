import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:flutter/foundation.dart';

class FeedNewsCellViewModel {

  List<Repository> evenList = [];
  List<Repository> oddList = [];
  String title;
  String subtitle;
  String description;
  RepositoriesType type;

  FeedNewsCellViewModel.fromRepositories({
    @required List<Repository> repositories, 
    @required String title, 
    @required String subtitle, 
    @required String description,
    @required RepositoriesType type
  }) {
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