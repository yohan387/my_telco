import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
<<<<<<< HEAD
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/features/pass/ui/widgets/special_gauge.dart';

class PassContainer extends StatelessWidget {
  final List<Widget> children;
  const PassContainer({super.key, required this.children});
=======
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
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.large),
      decoration: BoxDecoration(
<<<<<<< HEAD
        color: const Color.fromARGB(255, 246, 255, 247),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: const Color.fromARGB(255, 181, 241, 183)),
=======
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: _borderColor),
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
        boxShadow: const [BoxShadow(color: AppColors.grey, blurRadius: 2)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
<<<<<<< HEAD
        spacing: 12,
=======
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
        children: [
          _buildTitle(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
<<<<<<< HEAD
              _buildDateContainer(
                icon: AppAssetsSvgIcons.calendar,
                title: "Activation",
                date: "01/09/2025",
              ),
              _buildDateContainer(
                icon: AppAssetsSvgIcons.calendar,
                title: "Expiration",
                date: "01/09/2025",
=======
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
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
              ),
            ],
          ),

          HorizontalGauge(
<<<<<<< HEAD
            title: 'Data remaining',
            remainingText: '11 days',
            value: 4,
            maxValue: 15,
            height: 2,
            foregroundColor: Colors.green,
            backgroundColor: Colors.grey.shade200,
          ),
          Row(children: [...children]),
=======
            title: 'Temps restant',
            remainingText: pass.remainingDaysLabel,
            value: pass.remainingDaysValue,
            maxValue: pass.validityDays,
          ),
          child,
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
        ],
      ),
    );
  }

  Row _buildTitle() {
    return Row(
<<<<<<< HEAD
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
=======
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
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
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
<<<<<<< HEAD
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
=======
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
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
          ],
        ),
      ],
    );
  }
}
