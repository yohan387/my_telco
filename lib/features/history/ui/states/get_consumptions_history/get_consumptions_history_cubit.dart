import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/errors/failures.dart';
import 'package:my_telco/features/history/domain/entities/consumption_record.dart';
import 'package:my_telco/features/history/domain/repo/history_repo.dart';

part 'get_consumptions_history_state.dart';

class GetConsumptionsHistoryCubit extends Cubit<GetConsumptionsHistoryState> {
  final IHistoryRepo _historyRepo;
  GetConsumptionsHistoryCubit(this._historyRepo)
      : super(const GetConsumptionsHistoryInitial());

  Future<void> call() async {
    emit(const GetConsumptionsHistoryLoading());

    final result = await _historyRepo.getConsumptionHistory();

    result.fold(
      (failure) => emit(GetConsumptionsHistoryFailure(failure)),
      (records) => emit(GetConsumptionsHistorySuccess(records)),
    );
  }

  List<ConsumptionRecord> filterByType(ConsumptionType type) {
    if (state is GetConsumptionsHistorySuccess) {
      final records = (state as GetConsumptionsHistorySuccess).records;
      return records.where((r) => r.type == type).toList();
    }
    return [];
  }
}
