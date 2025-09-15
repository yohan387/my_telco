import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_telco/core/errors/failures.dart';
import 'package:my_telco/features/common/models/pass.dart';
import 'package:my_telco/features/pass/data/models/pass_group.dart';
import 'package:my_telco/features/pass/data/repo/pass_repo.dart';

part 'get_passes_state.dart';

class GetPassesCubit extends Cubit<GetPassesState> {
  final IPassRepo _passRepo;
  GetPassesCubit(this._passRepo) : super(const GetPassesInitial());

  Future<void> call() async {
    emit(const GetPassesLoading());

    final result = await _passRepo.getPasses();

    result.fold(
      (failure) => emit(GetPassesFailure(failure)),
      (groupedPasses) => emit(GetPassesSuccess(groupedPasses)),
    );
  }

  void selectPass(Pass pass) {
    final currentState = state;
    if (currentState is GetPassesSuccess) {
      emit(GetPassesSuccess(currentState.groupedPasses, selectedPass: pass));
    }
  }
}
