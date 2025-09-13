import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_telco/core/errors/failures.dart';
import 'package:my_telco/features/dashboard/data/repo/dashboard_repo.dart';
import 'package:my_telco/features/dashboard/domain/entities/customer.dart';

part 'get_dashboard_infos_state.dart';

class GetDashboardInfosCubit extends Cubit<GetDashboardInfosState> {
  final IDashboardRepo _dashboardRepo;
  GetDashboardInfosCubit(this._dashboardRepo)
    : super(const GetDashboardInfosInitial());

  Future<void> getDashboardInfos() async {
    emit(const GetDashboardInfosLoading());
    final result = await _dashboardRepo.getCustormerProfile();
    result.fold(
      (failure) => emit(GetDashboardInfosFailure(failure: failure)),
      (customer) => emit(GetDashboardInfosSuccess(customer: customer)),
    );
  }
}
