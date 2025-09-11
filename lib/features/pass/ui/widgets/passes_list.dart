import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/menus_title.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/features/common/ui/widgets/app_button.dart';
import 'package:my_telco/features/pass/ui/widgets/pass_container.dart';

class PassesList extends StatelessWidget {
  const PassesList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppPathCubit>();
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.xl,
        right: AppPadding.xl,
        top: AppPadding.xl,
      ),
      child: PassContainer(
        children: [
          Expanded(
            child: AppButton(
              label: "Résilier pass",
              onPressed: () => cubit.pushPage(AppMenus.cancelPass),
              backgroundColor: AppColors.transparent,
              borderColor: AppColors.black,
              textColor: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
