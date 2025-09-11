import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/common/ui/widgets/app_button.dart';
import 'package:my_telco/features/common/ui/widgets/app_common_navigation_bar.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCommonNavigationBar(
        title: "Confirmation",
        onBack: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppEmptySpace.verticalXl,
            const Center(
              child: AppIcon(
                imgPath: AppAssetsPngIcons.success,
                type: AppIconType.png,
                size: 128,
              ),
            ),
            AppEmptySpace.verticalXl,
            const Text(
              "Réussite",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
            const Text(
              "Forfait complet activé",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const Text(
              "Super ! Votre forfait a bien été activé",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            AppEmptySpace.verticalXl,
            AppButton(
              label: "Souscrire un autre pass",
              onPressed: () {},
            ),
            AppEmptySpace.verticalXl,
            AppButton(
              label: "Retour à l'accueil",
              onPressed: () {},
              backgroundColor: AppColors.transparent,
              borderColor: AppColors.black,
              textColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
