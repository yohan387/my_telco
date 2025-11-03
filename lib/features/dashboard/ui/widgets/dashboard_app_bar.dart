import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/core/utils/extensions.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/common/ui/widgets/loading_card.dart';
import 'package:my_telco/features/dashboard/ui/states/cubit/get_dashboard_infos_cubit.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 108,
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      title: BlocBuilder<GetDashboardInfosCubit, GetDashboardInfosState>(
        builder: (context, state) {
          if (state is GetDashboardInfosLoading) {
            return _buildContent(
              userName: null,
              phoneNumber: null,
              isLoading: true,
            );
          }

          if (state is GetDashboardInfosSuccess) {
            return _buildContent(
              userName: state.customer.name,
              phoneNumber: state.customer.phoneNumber,
              isLoading: false,
            );
          }

          if (state is GetDashboardInfosFailure) {
            return const Text(
              "Erreur de chargement",
              style: TextStyle(color: Colors.red),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContent({
    required String? userName,
    required String? phoneNumber,
    required bool isLoading,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const AppIcon(
              imgPath: AppAssetsPngIcons.profile,
              type: AppIconType.png,
              size: 72,
              padding: 0,
            ),
            const SizedBox(width: 8),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bienvenue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 71, 71, 71),
                  ),
                ),

                isLoading
                    ? const LoadingCard(width: 120, height: 20)
                    : Text(
                      userName ?? "-",
                      style: AppTextStyles.dashboardMainValue,
                    ),
              ],
            ),
          ],
        ),

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

              isLoading
                  ? const LoadingCard(width: 100, height: 16)
                  : Text(
                    phoneNumber?.formatAsPhoneNumber() ?? "-",
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
