import 'package:get_it/get_it.dart';
import 'package:my_telco/features/history/data/repo/history_repo.dart';
import 'package:my_telco/features/history/data/services/local_service.dart';
import 'package:my_telco/features/history/domain/repo/history_repo.dart';
import 'package:my_telco/features/history/ui/states/get_consumptions_history/get_consumptions_history_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _registerAuthDependencies();
}

Future<void> _registerAuthDependencies() async {
  sl
    ..registerLazySingleton<ILocalHistoryDataService>(
        () => LocalHistoryDataService())
    ..registerLazySingleton<IHistoryRepo>(() => HistoryRepo(sl()))
    ..registerFactory(() => GetConsumptionsHistoryCubit(sl()));
}
