import 'package:dartmazing/Network/worker.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_filters.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_presenter.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_request.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_response.dart';
import 'package:dartmazing_network/native_response.dart';

abstract class FeedInteractorAbstract {
  Future<RepositoriesPresenter> getRepositories();
}

class FeedInteractor extends FeedInteractorAbstract {
  final WorkerAbstract worker;

  FeedInteractor({this.worker});

  Future<RepositoriesPresenter> getRepositories() async {
    final starsResponse = await _starsRequest();
    final updatedResponse = await _updatedRequest();
    return RepositoriesPresenter(stars: starsResponse, updated: updatedResponse);
  }

  Future<NativeResponse<RepositoriesResponse>> _starsRequest() async {
    final starsRequest = RepositoriesRequest(RepositoriesFilters.stars);
    return worker.fetch(request: starsRequest,  factory: (json) => RepositoriesResponse.fromJson(json));
  }

  Future<NativeResponse<RepositoriesResponse>> _updatedRequest() async {
    final updatedRequest = RepositoriesRequest(RepositoriesFilters.updated);
    return worker.fetch(request: updatedRequest,  factory: (json) => RepositoriesResponse.fromJson(json));
  }

  

}