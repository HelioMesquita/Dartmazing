import 'package:bloc/bloc.dart';
import 'package:dartmazing/Scenes/Feed/Interactor/feed_interactor.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {

  final FeedInteractorAbstract interactor;
  
  FeedCubit({@required this.interactor}) : super(Loading()) {
    _getRepositories();
  }

  _getRepositories() async {
    interactor.getRepositories().then(_handleSuccess).catchError(_handleError);
  }

  _handleSuccess(RepositoriesViewModel viewModel) {
    emit(Loaded(viewModel: viewModel));
  }

  _handleError(Object object) {

  }

  seeMoreStarsRepositories() {

  }

  seeMoreUpdatedRepositories() {
    
  }

}
