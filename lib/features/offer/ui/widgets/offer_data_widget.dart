import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/core/utils/extensions.dart';
import 'package:my_telco/features/offer/data/models/offer.dart';

class OfferDataWidget extends StatelessWidget {
  final Offer offer;
  const OfferDataWidget({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        _buildDescription(),
        AppEmptySpace.verticalXl,
        _buildFeatures(),
        AppEmptySpace.verticalXl,
        Text(offer.price.formatAsAmount(), style: AppTextStyles.heading1),
        Text(offer.validityDays, style: AppTextStyles.bodyText3),
      ],
    );
  }

  Wrap _buildFeatures() {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: List.generate(offer.features.length, (index) {
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
      }),
    );
  }

  Row _buildDescription() {
    return Row(
      children: [
        const SizedBox(width: 34),
        Expanded(
          child: Text(
            offer.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyText3,
          ),
        ),
      ],
    );
  }

  Row _buildTitle() {
    return Row(
      children: [
        offer.icon,
        AppEmptySpace.horizontalLarge,
        Expanded(
          child: Text(offer.name, maxLines: 2, style: AppTextStyles.cardTitle),
        ),
        if (offer.specialIndication != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            decoration: BoxDecoration(
              color: _specialIndicationBgColor,
              borderRadius: BorderRadius.circular(AppRadius.small),
            ),
            child: Text(
              offer.specialIndication!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
      ],
    );
  }

  Color get _featureBackgroundColor =>
      offer.isPopular ? AppColors.white : AppColors.grayGradiant2;

  Color get _specialIndicationBgColor =>
      offer.isPopular ? AppColors.orangeGradiant2 : AppColors.grayGradiant2;
}
