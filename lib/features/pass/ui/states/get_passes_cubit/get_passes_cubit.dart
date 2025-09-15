import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_telco/core/errors/failures.dart';
import 'package:my_telco/features/common/models/pass.dart';
import 'package:my_telco/features/pass/data/repo/pass_repo.dart';

part 'get_passes_state.dart';

class GetPassesCubit extends Cubit<GetPassesState> {
  final IPassRepo _passRepo;
  GetPassesCubit(this._passRepo) : super(const GetPassesInitial());

  Future<void> call({bool forceRefresh = false}) async {
    final currentState = state;
    if (currentState is GetPassesSuccess && !forceRefresh) return;

    emit(const GetPassesLoading());

    final result = await _passRepo.getPasses();

    result.fold(
      (failure) => emit(GetPassesFailure(failure)),
      (records) => emit(GetPassesSuccess(records)),
    );
  }

  void selectPass(Pass pass) {
    final currentState = state;
    if (currentState is GetPassesSuccess) {
      emit(GetPassesSuccess(currentState.records, selectedPass: pass));
    }
  }
}
