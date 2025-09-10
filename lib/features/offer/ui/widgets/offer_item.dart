import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/utils/extensions.dart';
import 'package:my_telco/features/common/states/app_path_cubit/app_path_cubit.dart';
import 'package:my_telco/features/common/ui/app_button.dart';
import 'package:my_telco/core/constants/menus_title.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/features/common/ui/app_icon.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';

class OfferItem extends StatelessWidget {
  final Offer offer;
  const OfferItem({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppPathCubit>();

    return Container(
      padding: const EdgeInsets.all(AppPadding.large),
      decoration: BoxDecoration(
          color: _mainBackgroundColor,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          boxShadow: const [
            BoxShadow(
              color: AppColors.gray,
              blurRadius: 2,
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildDescription(),
          AppEmptySpace.verticalXl,
          _buildFeatures(),
          AppEmptySpace.verticalXl,
          Text(
            offer.price.formatAsAmount(),
            style: AppTextStyles.heading1,
          ),
          Text(
            offer.validityDays,
            style: AppTextStyles.bodyText3,
          ),
          AppEmptySpace.verticalXl,
          AppButton(
            label: "Souscrire",
            onPressed: () => cubit.pushPage(AppMenus.selectedOfferDetail),
            isEnabled: offer.isAvailable,
          ),
        ],
      ),
    );
  }

  Wrap _buildFeatures() {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: List.generate(
        offer.features.length,
        (index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            decoration: BoxDecoration(
              color: _featureBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              offer.features[index],
              style: AppTextStyles.bodyTextSecondary,
            ),
          );
        },
      ),
    );
  }

  Row _buildDescription() {
    return Row(
      children: [
        const SizedBox(
          width: 34,
        ),
        Text(
          offer.description,
          style: AppTextStyles.bodyText3,
        ),
      ],
    );
  }

  Row _buildTitle() {
    return Row(
      children: [
        _icon,
        AppEmptySpace.horizontalLarge,
        Expanded(
          child: Text(
            offer.name,
            maxLines: 2,
            style: AppTextStyles.cardTitle,
          ),
        ),
        if (offer.specialIndication != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            decoration: BoxDecoration(
                color: _specialIndicationBgColor,
                borderRadius: BorderRadius.circular(AppRadius.small)),
            child: Text(
              offer.specialIndication!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          )
      ],
    );
  }

  AppSvgIcon get _icon {
    switch (offer.type) {
      case OfferType.voice:
        return const AppSvgIcon(
          imgPath: AppAssetsSvgIcons.callOrange,
          color: AppColors.orangeGradiant3,
        );
      case OfferType.internet:
        if (offer.isPopular) {
          return const AppSvgIcon(
            imgPath: AppAssetsSvgIcons.all,
            color: AppColors.orangeGradiant3,
          );
        }
        return const AppSvgIcon(
          imgPath: AppAssetsSvgIcons.doubleArrow,
          color: AppColors.orangeGradiant3,
        );
      case OfferType.premium:
        return const AppSvgIcon(
          imgPath: AppAssetsSvgIcons.all,
          color: AppColors.orangeGradiant3,
        );
      case OfferType.weekend:
        return const AppSvgIcon(
          imgPath: AppAssetsSvgIcons.wifiOrange,
          color: AppColors.orangeGradiant3,
        );
    }
  }

  Color get _mainBackgroundColor =>
      offer.isPopular ? AppColors.orangeGradiant4 : AppColors.white;

  Color get _featureBackgroundColor =>
      offer.isPopular ? AppColors.white : AppColors.grayGradiant2;

  Color get _specialIndicationBgColor =>
      offer.isPopular ? AppColors.orangeGradiant2 : AppColors.grayGradiant2;
}
