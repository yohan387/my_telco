import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/core/utils/extensions.dart';

class DashboardCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String data;
  final DateTime dateValidity;
  final Color? titleBackgroundColor;
  final double titleBottomMargin;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
    required this.dateValidity,
    this.titleBackgroundColor,
    this.titleBottomMargin = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.xl),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: const [BoxShadow(color: AppColors.grey, blurRadius: 2)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: titleBottomMargin),
            child: Row(
              spacing: 8,
              children: [
                icon,

                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.normal,
                      vertical: AppPadding.small,
                    ),
                    decoration: BoxDecoration(
                      color: titleBackgroundColor,
                      borderRadius: BorderRadius.circular(AppRadius.normal),
                    ),
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),

          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 164;

              if (isWide) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data, style: AppTextStyles.dashboardMainValue),
                    Text("validité : ${dateValidity.toShortFrenchDate()}"),
                  ],
                );
              } else {
                return Column(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.dashboardMainValue,
                    ),
                    Text("validité : ${dateValidity.toShortFrenchDate()}"),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
