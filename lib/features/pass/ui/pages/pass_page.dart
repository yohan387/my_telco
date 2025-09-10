import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/common/states/app_path_cubit/app_path_cubit.dart';

import 'package:my_telco/core/constants/menus_title.dart';

class PassPage extends StatelessWidget {
  const PassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppPathCubit>();
    return BlocBuilder<AppPathCubit, AppPathState>(
      builder: (context, state) {
        if (cubit.state.currentPage == AppMenusTitle.subscriptions) {
          return Center(
            child: ElevatedButton(
              onPressed: () => cubit.pushPage(AppMenusTitle.cancelPass),
              child: const Text("Résilier pass"),
            ),
          );
        } else if (cubit.state.currentPage == AppMenusTitle.cancelPass) {
          return Row(
            children: [
              ElevatedButton(
                onPressed: () => cubit.popPage(),
                child: const Text("Annuler"),
              ),
              ElevatedButton(
                onPressed: () => cubit.popPage(),
                child: const Text("Confirmer résiliation"),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
