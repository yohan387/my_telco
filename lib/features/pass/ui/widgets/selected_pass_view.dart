import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/features/common/ui/widgets/app_button.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/features/pass/ui/widgets/pass_container.dart';
import 'package:my_telco/core/constants/style.dart';

class SelectedPassView extends StatelessWidget {
  const SelectedPassView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppPathCubit>();
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.xl,
        right: AppPadding.xl,
        top: AppPadding.xl,
      ),
      child: Column(
        spacing: 8,
        children: [
          const AppIcon(
            imgPath: AppAssetsPngIcons.warning,
            type: AppIconType.png,
            size: 192,
          ),
          const Text(
            textAlign: TextAlign.center,
            "Vous êtes sur le point de résilier votre forfait. Cette action est irréversible.",
          ),
          PassContainer(
            children: [
              Expanded(
                child: AppButton(
                  label: "Résilier pass",
                  onPressed: () => cubit.popPage(),
                  backgroundColor: AppColors.transparent,
                  borderColor: AppColors.black,
                  textColor: AppColors.black,
                ),
              ),
              AppEmptySpace.horizontalNormal,
              Expanded(
                child: AppButton(
                  label: "Confirmer résiliation",
                  onPressed: () => cubit.popPage(),
                  backgroundColor: AppColors.error,
                  borderColor: AppColors.error,
                  textColor: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
