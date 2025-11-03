part of 'get_passes_cubit.dart';

sealed class GetPassesState extends Equatable {
  const GetPassesState();

  @override
<<<<<<< HEAD
  List<Object> get props => [];
=======
  List<Object?> get props => [];
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
}

final class GetPassesInitial extends GetPassesState {
  const GetPassesInitial();
}

final class GetPassesLoading extends GetPassesState {
  const GetPassesLoading();
}

final class GetPassesSuccess extends GetPassesState {
<<<<<<< HEAD
  final List<Pass> records;
  const GetPassesSuccess(this.records);

  @override
  List<Object> get props => [records];
=======
  final PassGroup groupedPasses;
  final Pass? selectedPass;
  const GetPassesSuccess(this.groupedPasses, {this.selectedPass});

  @override
  List<Object?> get props => [groupedPasses, selectedPass];
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
}

final class GetPassesFailure extends GetPassesState {
  final Failure failure;
  const GetPassesFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
