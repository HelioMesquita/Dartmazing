import 'package:dartmazing/Models/repositories_request.dart';
import 'package:dartmazing/Models/repositories_response.dart';
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Network/worker.dart';
import 'package:dartmazing/Scenes/Feed/Models/feed_repositories_view_model.dart';
import 'package:dartmazing_network/native_response.dart';

abstract class FeedInteractorAbstract {
  Future<FeedRepositoriesViewModel> getRepositories();
}

class FeedInteractor extends FeedInteractorAbstract {
  final WorkerAbstract worker;

  FeedInteractor({this.worker});

  Future<FeedRepositoriesViewModel> getRepositories() async {
    return Future.wait([_starsRequest(), _updatedRequest()]).then((responses) {
      return FeedRepositoriesViewModel(stars: responses.first, updated: responses.last);
    }).catchError((error) {
      return error;
    });
  }

  Future<NativeResponse<RepositoriesResponse>> _starsRequest() async {
    final starsRequest = RepositoriesRequest(RepositoriesType.stars);
    return worker.fetch(request: starsRequest,  factory: (json) => RepositoriesResponse.fromJson(json));
  }

  Future<NativeResponse<RepositoriesResponse>> _updatedRequest() async {
    final updatedRequest = RepositoriesRequest(RepositoriesType.updated);
    return worker.fetch(request: updatedRequest,  factory: (json) => RepositoriesResponse.fromJson(json));
  }

  

}