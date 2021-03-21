import 'package:bloc/bloc.dart';
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Scenes/Feed/Interactor/feed_interactor.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Models/repositories_list_dto.dart';
import 'package:equatable/equatable.dart';

part 'repositories_list_state.dart';

class RepositoriesListCubit extends Cubit<RepositoriesListState> {
  final RepositoriesListDTO transferObject;
  final FeedInteractorAbstract interactor;

  RepositoriesListCubit({this.transferObject, this.interactor}) : super(Loaded(transferObject.repositories, transferObject.type));

  getRepositories() async {
  //   interactor.getRepositories().then(_handleSuccess).catchError(_handleError);
  // }

  // _handleSuccess(RepositoriesViewModel viewModel) {
  //   this.viewModel = viewModel;
    
  //   emit(Loaded(viewModel,));
  // }

  // _handleError(Object object) {

  }

}
