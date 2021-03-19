part of 'detail_cubit.dart';

abstract class DetailState extends Equatable {
  final DetailViewModel viewModel;

  const DetailState(this.viewModel);

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {
  DetailInitial(Repository repository) : super(DetailViewModel(repository));
}
