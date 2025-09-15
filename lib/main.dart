import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/core/dependencies_injection.dart';
import 'package:my_telco/core/theme/app_theme.dart';
import 'package:my_telco/features/common/ui/splash_screen.dart';
import 'package:my_telco/features/dashboard/ui/states/cubit/get_dashboard_infos_cubit.dart';
import 'package:my_telco/features/history/ui/states/get_consumptions_history/get_consumptions_history_cubit.dart';
import 'package:my_telco/features/offer/ui/states/get_offers_cubit/get_offers_cubit.dart';
import 'package:my_telco/features/offer/ui/states/subscribe_to_offer/subscribe_to_offer_cubit.dart';
import 'package:my_telco/features/pass/ui/states/cancel_pass_cubit/cancel_pass_cubit.dart';
import 'package:my_telco/features/pass/ui/states/get_passes_cubit/get_passes_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppPathCubit()),
        BlocProvider(create: (context) => sl<GetConsumptionsHistoryCubit>()),
        BlocProvider(create: (context) => sl<GetOffersCubit>()),
        BlocProvider(create: (context) => sl<SubscribeToOfferCubit>()),
        BlocProvider(create: (context) => sl<GetPassesCubit>()),
        BlocProvider(create: (context) => sl<CancelPassCubit>()),
        BlocProvider(create: (context) => sl<GetDashboardInfosCubit>()),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
