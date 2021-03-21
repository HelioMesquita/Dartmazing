import 'package:bloc/bloc.dart';
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Interactor/repositories_list_interactor.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Models/repositories_list_dto.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Models/repositories_list_view_model.dart';
import 'package:equatable/equatable.dart';

part 'repositories_list_state.dart';

class RepositoriesListCubit extends Cubit<RepositoriesListState> {
  final RepositoriesListDTO transferObject;
  final RepositoriesListInteractorAbstract interactor;
  int _nextPageThreshold = 2;
  int _page = 1;

  RepositoriesListCubit({this.transferObject, this.interactor}) : super(Loaded(transferObject.repositories, transferObject.type));

  getRepositories(int currentIndex) async {
    final totalRepositories = transferObject.repositories.length;
    if (currentIndex == totalRepositories - _nextPageThreshold) {
      interactor.getRepositories(transferObject.type, _page).then(_handleSuccess).catchError(_handleError);
    }
  }

  _handleSuccess(RepositoriesListViewModel viewModel) {
    transferObject.repositories.addAll(viewModel.responseRepositories);
    emit(Loaded(transferObject.repositories, transferObject.type));
    _page += 1;
  }

  _handleError(Object object) {

  }

}
