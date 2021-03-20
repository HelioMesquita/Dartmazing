import 'package:bloc/bloc.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Models/repositories_list_dto.dart';
import 'package:equatable/equatable.dart';

part 'repositories_list_state.dart';

class RepositoriesListCubit extends Cubit<RepositoriesListState> {
  final RepositoriesListDTO transferObject;
  
  RepositoriesListCubit({this.transferObject}) : super(RepositoriesListInitial());
}