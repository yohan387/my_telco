import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/core/utils/extensions.dart';
import 'package:my_telco/features/history/domain/entities/consumption_record.dart';

class ConsumtionRecordWidget extends StatelessWidget {
  final ConsumptionRecord item;
  const ConsumtionRecordWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.normal),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.xl)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              item.icon,
              AppEmptySpace.horizontalSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.dataUsage,
                    style: AppTextStyles.bodyTextSecondary,
                  ),
                  if (item.details != null)
                    Text(
                      "A : ${item.details!.formatAsPhoneNumber()}",
                      style: AppTextStyles.bodyTextPrimary,
                    )
                ],
              ),
            ],
          ),
          const Divider(color: AppColors.grey, height: 12),
          Text(
            item.date.toIso8601String(),
            style: AppTextStyles.bodyText3,
          ),
        ],
      ),
    );
  }
}
