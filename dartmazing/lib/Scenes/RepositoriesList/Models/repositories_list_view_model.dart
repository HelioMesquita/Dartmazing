
import 'package:dartmazing/Models/repositories_response.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing_network/native_response.dart';
import 'package:flutter/foundation.dart';

class RepositoriesListViewModel {
  final NativeResponse<RepositoriesResponse> response;

  RepositoriesListViewModel({@required this.response});

  List<Repository> get responseRepositories => _toRepositories(response);

  List<Repository> _toRepositories(NativeResponse<RepositoriesResponse> value) {
    return value.response.toRepositories();
  }

}