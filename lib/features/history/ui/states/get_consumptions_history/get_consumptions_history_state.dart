part of 'get_consumptions_history_cubit.dart';

sealed class GetConsumptionsHistoryState extends Equatable {
  const GetConsumptionsHistoryState();

  @override
  List<Object> get props => [];
}

final class GetConsumptionsHistoryInitial extends GetConsumptionsHistoryState {
  const GetConsumptionsHistoryInitial();
}

final class GetConsumptionsHistoryLoading extends GetConsumptionsHistoryState {
  const GetConsumptionsHistoryLoading();
}

final class GetConsumptionsHistorySuccess extends GetConsumptionsHistoryState {
  final List<ConsumptionRecord> records;
  const GetConsumptionsHistorySuccess(this.records);

  @override
  List<Object> get props => [records];
}

final class GetConsumptionsHistoryFailure extends GetConsumptionsHistoryState {
  final Failure failure;
  const GetConsumptionsHistoryFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
