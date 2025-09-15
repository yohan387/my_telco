import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/menus_title.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/constants/app_tab_page_index.dart';
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
      onRefresh: () => _getPassesCubit(forceRefresh: true),
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
              if (state.records.isEmpty) {
                return AppEmptyContent(
                  title: "Aucun pass souscrit",
                  userAction: () {
                    _appPathCubit.setTab(AppTabPageIndex.offersPage);
                  },
                );
              }

              return ListView.builder(
                itemCount: state.records.length,
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
        ),
      ),
    );
  }
}
