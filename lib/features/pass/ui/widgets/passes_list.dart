import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/menus_title.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/constants/app_tab_page_index.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/features/common/ui/widgets/app_button.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/features/pass/ui/states/get_passes_cubit/get_passes_cubit.dart';
import 'package:my_telco/features/pass/ui/widgets/pass_container.dart';

class PassesList extends StatefulWidget {
  const PassesList({super.key});

  @override
  State<PassesList> createState() => _PassesListState();
}

class _PassesListState extends State<PassesList> {
  late final GetPassesCubit _getPassesCubit;
  late final AppPathCubit _appPathCubit;

  @override
  void initState() {
    super.initState();

    _getPassesCubit = context.read<GetPassesCubit>();
    _appPathCubit = context.read<AppPathCubit>();
    _getPassesCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetPassesCubit, GetPassesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetPassesLoading) {
          return const CircularProgressIndicator();
        }

        if (state is GetPassesFailure) {
          return const Text("Failure");
        }

        if (state is GetPassesSuccess) {
          if (state.records.isEmpty) {
            return SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  const AppIcon(
                    imgPath: AppAssetsPngIcons.emptyContent,
                    type: AppIconType.png,
                    size: 62,
                  ),
                  const Text(
                    "Aucun pass souscrit.",
                    style: AppTextStyles.bodyTextPrimary,
                  ),
                  SizedBox(
                    width: 256,
                    child: AppButton(
                      label: "Souscrire à un forfait",
                      onPressed: () {
                        _appPathCubit.setTab(AppTabPageIndex.offersPage);
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: state.records.length,
            padding: const EdgeInsets.only(
              left: AppPadding.xl,
              right: AppPadding.xl,
              top: AppPadding.xl,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.xl),
                child: PassContainer(
                  pass: state.records[index],
                  child: AppButton(
                    label: "Résilier pass",
                    onPressed: () {
                      _getPassesCubit.selectPass(state.records[index]);
                      _appPathCubit.pushPage(AppMenus.cancelPass);
                    },
                    backgroundColor: AppColors.transparent,
                    borderColor: AppColors.black,
                    textColor: AppColors.black,
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
