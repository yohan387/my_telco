part of 'get_dashboard_infos_cubit.dart';

sealed class GetDashboardInfosState extends Equatable {
  const GetDashboardInfosState();

  @override
  List<Object> get props => [];
}

final class GetDashboardInfosInitial extends GetDashboardInfosState {
  const GetDashboardInfosInitial();
}

final class GetDashboardInfosLoading extends GetDashboardInfosState {
  const GetDashboardInfosLoading();
}

final class GetDashboardInfosSuccess extends GetDashboardInfosState {
  final Customer customer;

  const GetDashboardInfosSuccess({required this.customer});

  @override
  List<Object> get props => [customer];
}

final class GetDashboardInfosFailure extends GetDashboardInfosState {
  final Failure failure;

  const GetDashboardInfosFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
