import 'package:dartmazing/Models/repositories_request.dart';
import 'package:dartmazing/Models/repositories_response.dart';
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Network/worker.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Models/repositories_list_view_model.dart';

abstract class RepositoriesListInteractorAbstract {
  Future<RepositoriesListViewModel> getRepositories(
      RepositoriesType type, int page);
}

class RepositoriesListInteractor extends RepositoriesListInteractorAbstract {
  WorkerAbstract worker;

  RepositoriesListInteractor({required this.worker});

  Future<RepositoriesListViewModel> getRepositories(
      RepositoriesType type, int page) async {
    final starsRequest = RepositoriesRequest(type, page);
    final request = worker.fetch(
        request: starsRequest,
        factory: (json) => RepositoriesResponse.fromJson(json));

    return request.then((response) {
      return RepositoriesListViewModel(response: response);
    }).catchError((error) {
      return error;
    });
  }
}
