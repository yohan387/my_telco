import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/core/utils/extensions.dart';
import 'package:my_telco/features/common/models/pass.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/features/pass/ui/widgets/horizontal_gauge.dart';

class PassContainer extends StatelessWidget {
  final Pass pass;
  final Widget child;
  const PassContainer({super.key, required this.pass, required this.child});

  Color get _backgroundColor =>
      pass.remainingDaysValue <= 0
          ? const Color.fromARGB(255, 255, 250, 249)
          : const Color.fromARGB(255, 251, 255, 251);

  Color get _borderColor =>
      pass.remainingDaysValue <= 0
          ? const Color.fromARGB(255, 252, 221, 218)
          : const Color.fromARGB(255, 201, 253, 203);

  Color get _badgeTextColor =>
      pass.remainingDaysValue <= 0 ? Colors.red : Colors.green;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.large),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: _borderColor),
        boxShadow: const [BoxShadow(color: AppColors.grey, blurRadius: 2)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          _buildTitle(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: _buildDateContainer(
                  icon: AppAssetsSvgIcons.calendar,
                  title: "Activation",
                  date: pass.activationDate.toShortFrenchDate(),
                ),
              ),
              Flexible(
                child: _buildDateContainer(
                  icon: AppAssetsSvgIcons.calendar,
                  title: "Expiration",
                  date: pass.expirationDate.toShortFrenchDate(),
                ),
              ),
            ],
          ),

          HorizontalGauge(
            title: 'Temps restant',
            remainingText: pass.remainingDaysLabel,
            value: pass.remainingDaysValue,
            maxValue: pass.validityDays,
          ),
          child,
        ],
      ),
    );
  }

  Row _buildTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              pass.offer.icon,
              AppEmptySpace.horizontalLarge,
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  pass.offer.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppTextStyles.cardTitle,
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
          decoration: BoxDecoration(
            color: _badgeTextColor.withAlpha(36),
            borderRadius: BorderRadius.circular(AppRadius.normal),
          ),
          child: Text(
            pass.statusLabel,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: _badgeTextColor,
            ),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        AppIcon(imgPath: icon),

        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 0,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),

            Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
