import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_telco/core/errors/failures.dart';
import 'package:my_telco/features/pass/data/repo/pass_repo.dart';

part 'cancel_pass_state.dart';

class CancelPassCubit extends Cubit<CancelPassState> {
  final IPassRepo _passRepo;
  CancelPassCubit(this._passRepo) : super(const CancelPassInitial());

  Future<void> call(int passId) async {
    emit(const CancelPassLoading());

    final result = await _passRepo.cancelPass(passId);

    result.fold(
      (failure) => emit(CancelPassFailure(failure)),
      (_) => emit(const CancelPassSuccess()),
    );
  }
}
