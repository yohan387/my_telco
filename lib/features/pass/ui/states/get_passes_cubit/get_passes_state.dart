part of 'get_passes_cubit.dart';

sealed class GetPassesState extends Equatable {
  const GetPassesState();

  @override
  List<Object?> get props => [];
}

final class GetPassesInitial extends GetPassesState {
  const GetPassesInitial();
}

final class GetPassesLoading extends GetPassesState {
  const GetPassesLoading();
}

final class GetPassesSuccess extends GetPassesState {
  final PassGroup groupedPasses;
  final Pass? selectedPass;
  const GetPassesSuccess(this.groupedPasses, {this.selectedPass});

  @override
  List<Object?> get props => [groupedPasses, selectedPass];
}

final class GetPassesFailure extends GetPassesState {
  final Failure failure;
  const GetPassesFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
