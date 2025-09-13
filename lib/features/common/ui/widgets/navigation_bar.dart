import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/core/utils/extensions.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';

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

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 108, // augmente la hauteur de l’AppBar
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🔹 Premier Row
          const Row(
            children: [
              AppIcon(
                imgPath: AppAssetsPngIcons.profile,
                type: AppIconType.png,
                size: 72,
                padding: 0,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenue",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                  Text(
                    "Eddy sosthene",
                    style: AppTextStyles.dashboardMainValue,
                  ),
                ],
              ),
            ],
          ),

          // 🔹 Deuxième Row
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: AppPadding.small,
            ),
            child: Row(
              children: [
                const AppIcon(
                  imgPath: AppAssetsSvgIcons.puce,
                  color: AppColors.orangeGradiant3,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Numéro mobile : ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 71, 71, 71),
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Text(
                  "0654321098".formatAsPhoneNumber(),
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
