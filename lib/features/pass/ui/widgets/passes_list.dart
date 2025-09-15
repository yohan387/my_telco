import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/menus_title.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/constants/app_tab_page_index.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/features/common/ui/widgets/app_button.dart';
import 'package:my_telco/features/common/ui/widgets/app_empty_content.dart';
import 'package:my_telco/features/common/ui/widgets/app_failure_widget.dart';
import 'package:my_telco/features/common/ui/widgets/app_placeholder_list.dart';
import 'package:my_telco/features/common/ui/widgets/snack_bar.dart';
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
    return RefreshIndicator(
      onRefresh: () => _getPassesCubit(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.xl,
          right: AppPadding.xl,
          top: AppPadding.xl,
        ),
        child: BlocConsumer<GetPassesCubit, GetPassesState>(
          listener: (context, state) {
            if (state is GetPassesFailure) {
              showTopLeftSnackBar(
                context: context,
                icon: const Icon(Icons.error, color: AppColors.error),
                message: state.failure.userMessage,
              );
            }
          },
          builder: (context, state) {
            if (state is GetPassesLoading) {
              return const AppPlaceholderList(itemCount: 3, height: 216);
            }

            if (state is GetPassesFailure) {
              return AppFailureWidget(
                mainMessage: "Erreur lors du chargement des pass",
                retryMessage: "Réessayer",
                userAction: () => _getPassesCubit(),
              );
            }

            if (state is GetPassesSuccess) {
              final grouped = state.groupedPasses;

              if (grouped.valid.isEmpty && grouped.expired.isEmpty) {
                return AppEmptyContent(
                  title: "Aucun pass souscrit",
                  userAction: () {
                    _appPathCubit.setTab(AppTabPageIndex.offersPage);
                  },
                );
              }

              return ListView(
                padding: const EdgeInsets.only(bottom: AppPadding.xl),
                children: [
                  if (grouped.valid.isNotEmpty) ...[
                    Text(
                      "Mes pass actifs (${grouped.validPassCountLabel})",
                      style: AppTextStyles.heading2,
                    ),
                    const SizedBox(height: AppPadding.large),

                    ...grouped.valid.map(
                      (pass) => Padding(
                        padding: const EdgeInsets.only(bottom: AppPadding.xl),
                        child: PassContainer(
                          pass: pass,
                          child: AppButton(
                            label: "Résilier pass",
                            onPressed: () {
                              _getPassesCubit.selectPass(pass);
                              _appPathCubit.pushPage(AppMenus.cancelPass);
                            },
                            backgroundColor: AppColors.transparent,
                            borderColor: AppColors.black,
                            textColor: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ],

                  if (grouped.expired.isNotEmpty) ...[
                    const SizedBox(height: AppPadding.xl),
                    Text(
                      "Mes pass inactifs (${grouped.expiredPassCountLabel})",
                      style: AppTextStyles.heading2,
                    ),
                    const SizedBox(height: AppPadding.large),

                    ...grouped.expired.map(
                      (pass) => Padding(
                        padding: const EdgeInsets.only(bottom: AppPadding.xl),
                        child: PassContainer(
                          pass: pass,
                          child: AppButton(
                            label: "Renouveler pass",
                            onPressed: () {
                              _appPathCubit.setTab(AppTabPageIndex.offersPage);
                            },
                            backgroundColor: AppColors.transparent,
                            borderColor: AppColors.black,
                            textColor: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
