import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/features/common/ui/widgets/loading_card.dart';
import 'package:my_telco/features/dashboard/domain/entities/customer.dart';
import 'package:my_telco/features/dashboard/ui/states/cubit/get_dashboard_infos_cubit.dart';
import 'package:my_telco/features/dashboard/ui/widgets/dashboard_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const sectionTitleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GetDashboardInfosCubit>();
    cubit.getDashboardInfos();

    return RefreshIndicator(
      onRefresh: () => cubit.getDashboardInfos(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.xl),
        child: BlocBuilder<GetDashboardInfosCubit, GetDashboardInfosState>(
          builder: (context, state) {
            final isLoading = state is GetDashboardInfosLoading;
            final isFailure = state is GetDashboardInfosFailure;

            if (isFailure) {
              return Center(child: Text(state.failure.userMessage));
            }

            final customer =
                state is GetDashboardInfosSuccess ? state.customer : null;

            return Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle("Mon solde"),
                isLoading
                    ? const LoadingCard(width: double.infinity, height: 80)
                    : DashboardCard(
                      icon: const AppIcon(
                        imgPath: AppAssetsSvgIcons.balance,
                        color: AppColors.orangeGradiant3,
                      ),
                      title: "Solde principal",
                      data: "${customer!.balance.toStringAsFixed(2)} FCFA",
                      dateValidity: customer.balanceValidity,
                      titleBackgroundColor: AppColors.grayGradiant2,
                      titleBottomMargin: AppPadding.large,
                    ),

                _buildTitle("Volume restant"),
                isLoading
                    ? _buildPlaceholderContent()
                    : _biuldLoadedContent(customer),
              ],
            );
          },
        ),
      ),
    );
  }

  GridView _biuldLoadedContent(Customer? customer) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: customer!.data.length,
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
    );
  }

  GridView _buildPlaceholderContent() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: 3,
      itemBuilder:
          (context, index) =>
              const LoadingCard(width: double.infinity, height: 80),
    );
  }

  Text _buildTitle(String title) =>
      Text(title, style: DashboardPage.sectionTitleTextStyle);
}
