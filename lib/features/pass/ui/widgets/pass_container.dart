import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/features/pass/ui/widgets/special_gauge.dart';

class PassContainer extends StatelessWidget {
  final List<Widget> children;
  const PassContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.large),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 246, 255, 247),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: const Color.fromARGB(255, 181, 241, 183)),
        boxShadow: const [BoxShadow(color: AppColors.grey, blurRadius: 2)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          _buildTitle(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDateContainer(
                icon: AppAssetsSvgIcons.calendar,
                title: "Activation",
                date: "01/09/2025",
              ),
              _buildDateContainer(
                icon: AppAssetsSvgIcons.calendar,
                title: "Expiration",
                date: "01/09/2025",
              ),
            ],
          ),

          HorizontalGauge(
            title: 'Data remaining',
            remainingText: '11 days',
            value: 4,
            maxValue: 15,
            height: 2,
            foregroundColor: Colors.green,
            backgroundColor: Colors.grey.shade200,
          ),
          Row(children: [...children]),
        ],
      ),
    );
  }

  Row _buildTitle() {
    return Row(
      children: [
        const Row(
          children: [
            AppIcon(
              imgPath: AppAssetsSvgIcons.all,
              color: AppColors.orangeGradiant4,
            ),
            AppEmptySpace.horizontalLarge,
            Text("Pass Appel", maxLines: 2, style: AppTextStyles.cardTitle),
          ],
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(AppRadius.small),
          ),
          child: const Text(
            "Actif",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildDateContainer({
    required String icon,
    required String title,
    required String date,
  }) {
    return Column(
      spacing: 8,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [AppIcon(imgPath: icon), Text(title)],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 32),
            Text(date, style: AppTextStyles.bodyTextPrimary),
          ],
        ),
      ],
    );
  }
}
