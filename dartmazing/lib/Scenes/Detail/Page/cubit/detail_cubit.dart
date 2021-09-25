import 'package:bloc/bloc.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Scenes/Detail/Models/detail_view_model.dart';
import 'package:equatable/equatable.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit({required Repository repository})
      : super(DetailInitial(repository));
}
