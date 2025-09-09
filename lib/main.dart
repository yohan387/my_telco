import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/common/ui/main_screen.dart';
import 'package:my_telco/core/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/core/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppPathCubit()),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        home: const MainScreen(),
      ),
    );
  }
}
