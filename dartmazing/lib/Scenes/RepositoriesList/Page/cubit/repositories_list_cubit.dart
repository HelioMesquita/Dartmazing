import 'package:bloc/bloc.dart';
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Interactor/repositories_list_interactor.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Models/repositories_list_dto.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Models/repositories_list_view_model.dart';
import 'package:equatable/equatable.dart';

part 'repositories_list_state.dart';

class RepositoriesListCubit extends Cubit<RepositoriesListState> {
  RepositoriesListDTO transferObject;
  RepositoriesListInteractorAbstract interactor;
  int _currentPage = 1;

  RepositoriesListCubit(
      {required this.transferObject, required this.interactor})
      : super(Loaded(transferObject.repositories, transferObject.type));

  getRepositories() async {
    if (!(state is Loading) &&
        state.repositories.length <= transferObject.totalItems) {
      final nextPage = _currentPage + 1;
      emit(Loading(state.repositories, state.type));
      interactor
          .getRepositories(transferObject.type, nextPage)
          .then(_handleSuccess)
          .catchError(_handleError);
    }
  }

  _handleSuccess(RepositoriesListViewModel viewModel) {
    transferObject.repositories.addAll(viewModel.responseRepositories);
    final newList = transferObject.repositories;
    ++_currentPage;
    emit(Loaded(newList, transferObject.type));
  }

  _handleError(Object object) {}
}
