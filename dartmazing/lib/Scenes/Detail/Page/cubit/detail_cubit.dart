import 'package:bloc/bloc.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:equatable/equatable.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  final Repository repository;

  DetailCubit({this.repository}) : super(DetailInitial());
}
