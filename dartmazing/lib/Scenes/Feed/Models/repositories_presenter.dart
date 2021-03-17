import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_response.dart';
import 'package:dartmazing_network/native_response.dart';

class RepositoriesPresenter {
  final NativeResponse<RepositoriesResponse> stars;
  final NativeResponse<RepositoriesResponse> updated;

  RepositoriesPresenter({this.stars, this.updated});

  List<Repository> get starsToRepository => _toRepository(stars);
  List<Repository> get updatedToRepository => _toRepository(updated);

  List<Repository> _toRepository(NativeResponse<RepositoriesResponse> value) {
    return value.response.items.map((e) => Repository(
      name: e.name, 
      author: e.owner.login, 
      stars: e.stargazersCount.toString(), 
      imageURL: e.htmlUrl)).toList();
  }

  // bool isSuccess() {
  //   final updatedStatusCode = int.parse(updated.statusCode) ?? 0;
  //   final starsStatusCode = int.parse(stars.statusCode) ?? 0;


  //   if (updatedStatusCode >= 200 && )
  // }
  
}