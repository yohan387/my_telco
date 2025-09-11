import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';

import 'package:my_telco/core/constants/menus_title.dart';
import 'package:my_telco/features/pass/ui/widgets/passes_list.dart';
import 'package:my_telco/features/pass/ui/widgets/selected_pass_view.dart';

class PassPage extends StatelessWidget {
  const PassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppPathCubit>();
    return BlocBuilder<AppPathCubit, AppPathState>(
      builder: (context, state) {
        if (cubit.state.currentPage == AppMenus.subscriptions) {
          return const PassesList();
        }

        if (cubit.state.currentPage == AppMenus.cancelPass) {
          return const SelectedPassView();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
