import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/features/dashboard/ui/states/cubit/get_dashboard_infos_cubit.dart';
import 'package:my_telco/features/dashboard/ui/widgets/dashboard_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetDashboardInfosCubit>().getDashboardInfos();
    const sectionTitleTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
    return BlocConsumer<GetDashboardInfosCubit, GetDashboardInfosState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetDashboardInfosLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetDashboardInfosFailure) {
          return Center(child: Text(state.failure.userMessage));
        }

        if (state is GetDashboardInfosSuccess) {
          final customer = state.customer;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.xl),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Mon solde", style: sectionTitleTextStyle),

                  DashboardCard(
                    icon: const AppIcon(
                      imgPath: AppAssetsSvgIcons.balance,
                      color: AppColors.orangeGradiant3,
                    ),
                    title: "Solde principal",
                    data: "${customer.balance.toStringAsFixed(2)} FCFA",
                    dateValidity: customer.balanceValidity,
                    titleBackgroundColor: AppColors.grayGradiant2,
                    titleBottomMargin: AppPadding.large,
                  ),

                  const Text("Volume restant", style: sectionTitleTextStyle),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                    itemCount: customer.data.length,
                    itemBuilder: (context, index) {
                      final data = customer.data[index];
                      return DashboardCard(
                        icon: const AppIcon(
                          imgPath: AppAssetsSvgIcons.balance,
                          color: AppColors.orangeGradiant3,
                        ),
                        title: data.type,
                        data: data.value,
                        dateValidity: data.dateValidity,
                        titleBottomMargin: AppPadding.small,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
