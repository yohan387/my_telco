import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/features/common/ui/widgets/app_button.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';

class AppEmptyContent extends StatelessWidget {
  final String title;
  final VoidCallback userAction;

  const AppEmptyContent({
    super.key,
    required this.title,
    required this.userAction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          const AppIcon(
            imgPath: AppAssetsPngIcons.emptyContent,
            type: AppIconType.png,
            size: 62,
          ),
          Text(title, style: AppTextStyles.bodyTextPrimary),
          SizedBox(
            width: 256,
            child: AppButton(
              label: "Souscrire à un forfait",
              onPressed: userAction,
            ),
          ),
        ],
      ),
    );
  }
}
