import 'package:get_it/get_it.dart';
import 'package:my_telco/features/history/data/repo/history_repo.dart';
import 'package:my_telco/features/history/data/services/local_service.dart';
import 'package:my_telco/features/history/domain/repo/history_repo.dart';
import 'package:my_telco/features/history/ui/states/get_consumptions_history/get_consumptions_history_cubit.dart';
import 'package:my_telco/features/offer/data/repo/offers_repo.dart';
import 'package:my_telco/features/offer/data/services/local_service.dart';
import 'package:my_telco/features/offer/domain/repo/offer_repo.dart';
import 'package:my_telco/features/offer/ui/states/get_offers_cubit/get_offers_cubit.dart';
import 'package:my_telco/features/offer/ui/states/subscribe_to_offer/subscribe_to_offer_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initExternalLibraries();
  _registerHistoryDependencies();
  _registerOfferDependencies();
}

Future<void> _registerHistoryDependencies() async {
  sl
    ..registerLazySingleton<ILocalHistoryDataService>(
        () => LocalHistoryDataService())
    ..registerLazySingleton<IHistoryRepo>(() => HistoryRepo(sl()))
    ..registerFactory(() => GetConsumptionsHistoryCubit(sl()));
}

Future<void> _registerOfferDependencies() async {
  sl
    ..registerLazySingleton<ILocalOfferDataService>(
        () => LocalOfferDataService(sl<SharedPreferences>()))
    ..registerLazySingleton<IOfferRepo>(() => OfferRepo(sl()))
    ..registerFactory(() => SubscribeToOfferCubit(sl()))
    ..registerFactory(() => GetOffersCubit(sl()));
}

Future<void> _initExternalLibraries() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => prefs);
}
