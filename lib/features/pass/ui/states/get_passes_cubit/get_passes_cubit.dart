import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_telco/core/errors/failures.dart';
<<<<<<< HEAD
import 'package:my_telco/features/common/ui/entities/pass.dart';
=======
import 'package:my_telco/features/common/models/pass.dart';
import 'package:my_telco/features/pass/data/models/pass_group.dart';
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
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
<<<<<<< HEAD
      (records) => emit(GetPassesSuccess(records)),
    );
  }
=======
      (groupedPasses) => emit(GetPassesSuccess(groupedPasses)),
    );
  }

  void selectPass(Pass pass) {
    final currentState = state;
    if (currentState is GetPassesSuccess) {
      emit(GetPassesSuccess(currentState.groupedPasses, selectedPass: pass));
    }
  }
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
}
