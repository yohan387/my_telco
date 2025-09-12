import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';

class AppCommonNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBack;
  const AppCommonNavigationBar({super.key, this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AppPathCubit>();
    final state = cubit.state;

    final canPop = state.stackLength > 1;

    return AppBar(
      title: Text(title ?? state.currentPage),
      leadingWidth: 72,
      leading:
          canPop
              ? IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.grey),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: onBack ?? cubit.popPage,
                icon: const Icon(Icons.arrow_back_ios_rounded),
                color: AppColors.black,
                iconSize: 20,
                alignment: Alignment.center,
              )
              : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
