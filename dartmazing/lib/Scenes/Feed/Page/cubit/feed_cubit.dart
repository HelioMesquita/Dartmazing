import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Scenes/Feed/Interactor/feed_interactor.dart';
import 'package:dartmazing/Scenes/Feed/Models/feed_repositories_view_model.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Models/repositories_list_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {

  static const MethodChannel _channel = const MethodChannel('channel.swiftmazing');
  
  final FeedInteractorAbstract interactor;
  FeedRepositoriesViewModel viewModel;

  FeedCubit({@required this.interactor}) : super(Loading()) {
    getRepositories();
  }

  dismissFlutter() {
    _channel.invokeMethod('dismissFlutter');
  }

  openNativeScreen() {
    _channel.invokeMethod('openNativeScreen');
  }

  Future<void> getRepositories() async {
    final completer = Completer();
    interactor.getRepositories().then(_handleSuccess).catchError(_handleError).whenComplete( () {
      completer.complete();
    });
    return completer.future;
  }

  _handleSuccess(FeedRepositoriesViewModel viewModel) {
    this.viewModel = viewModel;
    emit(Loaded(viewModel: viewModel));
  }

  _handleError(Object object) {
    emit(Error());
  }

  seeMore(RepositoriesType type) {
    if (type == RepositoriesType.stars) {
      _seeMoreStarsRepositories(type);
    } else {
      _seeMoreUpdatedRepositories(type);
    }
  }

  _seeMoreStarsRepositories(RepositoriesType type) {
    emit(PresentRepositoriesList(repositories: viewModel.starsRepositories, type: type, totalItems: viewModel.starsTotalItems));
    emit(Loaded(viewModel: viewModel));
  }

  _seeMoreUpdatedRepositories(RepositoriesType type) {
    emit(PresentRepositoriesList(repositories: viewModel.updatedRepositories, type: type, totalItems: viewModel.updatedTotalItems));
    emit(Loaded(viewModel: viewModel));
  }

}
