import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/enums.dart';
<<<<<<< HEAD
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/features/common/ui/widgets/app_button.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
=======
import 'package:my_telco/features/common/models/pass.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/features/common/ui/widgets/app_button.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/features/common/ui/widgets/snack_bar.dart';
import 'package:my_telco/features/pass/ui/states/cancel_pass_cubit/cancel_pass_cubit.dart';
import 'package:my_telco/features/pass/ui/states/get_passes_cubit/get_passes_cubit.dart';
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
import 'package:my_telco/features/pass/ui/widgets/pass_container.dart';
import 'package:my_telco/core/constants/style.dart';

class SelectedPassView extends StatelessWidget {
  const SelectedPassView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppPathCubit>();
<<<<<<< HEAD
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
=======

    return BlocListener<CancelPassCubit, CancelPassState>(
      listener: (context, state) {
        if (state is CancelPassSuccess) {
          showTopLeftSnackBar(
            context: context,
            icon: Container(
              padding: const EdgeInsets.all(AppPadding.normal),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 2, 235, 122),
              ),
              child: const Icon(Icons.done, color: AppColors.white),
            ),
            message: "Le pass a été résilié",
          );
          context.read<GetPassesCubit>()();
          cubit.popPage();
        }
      },
      child: Padding(
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
            BlocBuilder<GetPassesCubit, GetPassesState>(
              builder: (context, state) {
                if (state is GetPassesSuccess) {
                  final selectedPass = state.selectedPass!;

                  return PassContainer(
                    pass: selectedPass,
                    child: BlocBuilder<CancelPassCubit, CancelPassState>(
                      builder: (context, state) {
                        if (state is CancelPassLoading) {
                          return const CircularProgressIndicator();
                        }

                        return _buildActionButtons(
                          context,
                          cubit,
                          selectedPass,
                        );
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    AppPathCubit cubit,
    Pass selectedPass,
  ) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            label: "Annuler",
            onPressed: () {
              cubit.popPage();
            },
            backgroundColor: AppColors.transparent,
            borderColor: AppColors.black,
            textColor: AppColors.black,
          ),
        ),
        AppEmptySpace.horizontalNormal,
        Expanded(
          child: AppButton(
            label: "Confirmer résiliation",
            onPressed:
                () => context.read<CancelPassCubit>().call(selectedPass.id),
            backgroundColor: AppColors.error,
            borderColor: AppColors.error,
            textColor: AppColors.white,
          ),
        ),
      ],
    );
  }
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
}
