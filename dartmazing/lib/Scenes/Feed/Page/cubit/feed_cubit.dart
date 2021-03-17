import 'package:bloc/bloc.dart';
import 'package:dartmazing/Components/FeedRepositoriesSection/feed_repositories_section_view_model.dart';
import 'package:dartmazing/Scenes/Feed/Interactor/feed_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {

  final FeedInteractorAbstract interactor;
  
  FeedCubit({@required this.interactor}) : super(Loading()) {
    _getRepositories();
  }

  _getRepositories() async {
    final presenter = await interactor.getRepositories();
    final starsSection = FeedRepositoriesSectionViewModel(repositories: presenter.starsToRepository);
    final updatedSection = FeedRepositoriesSectionViewModel(repositories: presenter.updatedToRepository);
    emit(Loaded(starsSection: starsSection, updatedSection: updatedSection));
  }

}
