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
  double _nextPageThreshold = 0.9;
  int _page = 1;

  RepositoriesListCubit({this.transferObject, this.interactor}) : super(Loaded(transferObject.repositories, transferObject.type));

  getRepositories(double currentPosition, double maxScrollExtent) async {
    if (currentPosition == maxScrollExtent) {
      _page += 1;
      interactor.getRepositories(transferObject.type, _page).then(_handleSuccess).catchError(_handleError);
    }
  }

  _handleSuccess(RepositoriesListViewModel viewModel) {
    transferObject.repositories.addAll(viewModel.responseRepositories);
    emit(Loaded(transferObject.repositories, transferObject.type));
  }

  _handleError(Object object) {

  }

}
