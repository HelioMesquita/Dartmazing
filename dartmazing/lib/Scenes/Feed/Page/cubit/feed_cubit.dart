import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Scenes/Feed/Interactor/feed_interactor.dart';
import 'package:dartmazing/Scenes/Feed/Models/repositories_view_model.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Models/repositories_list_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {

  final FeedInteractorAbstract interactor;
  RepositoriesViewModel viewModel;

  FeedCubit({@required this.interactor}) : super(Loading()) {
    getRepositories();
  }

  Future<void> getRepositories() async {
    final completer = Completer();
    interactor.getRepositories().then(_handleSuccess).catchError(_handleError).whenComplete( () {
      completer.complete();
    });
    return completer.future;
  }

  _handleSuccess(RepositoriesViewModel viewModel) {
    this.viewModel = viewModel;
    emit(Loaded(viewModel: viewModel));
  }

  _handleError(Object object) {

  }

  _seeMoreStarsRepositories(RepositoriesType type) {
    emit(PresentRepositoriesList(repositories: viewModel.starsRepositories, type: type));
    emit(Loaded(viewModel: viewModel));
  }

  _seeMoreUpdatedRepositories(RepositoriesType type) {
    emit(PresentRepositoriesList(repositories: viewModel.updatedRepositories, type: type));
    emit(Loaded(viewModel: viewModel));
  }

  seeMore(RepositoriesType type) {
    if (type == RepositoriesType.stars) {
      _seeMoreStarsRepositories(type);
    } else {
      _seeMoreUpdatedRepositories(type);
    }
  }

}
