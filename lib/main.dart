import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/features/common/ui/main_screen.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/core/dependencies_injection.dart';
import 'package:my_telco/core/theme/app_theme.dart';
import 'package:my_telco/features/history/ui/states/get_consumptions_history/get_consumptions_history_cubit.dart';
import 'package:my_telco/features/offer/ui/states/get_offers_cubit/get_offers_cubit.dart';
import 'package:my_telco/features/offer/ui/states/subscribe_to_offer/subscribe_to_offer_cubit.dart';

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
      ],
      child: MaterialApp(theme: AppTheme.lightTheme, home: const MainScreen()),
    );
  }
}
