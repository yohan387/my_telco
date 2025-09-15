import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/features/offer/data/entities/offer.dart';

class OfferCard extends StatelessWidget {
  final Offer? offer;
  final Widget? child;
  const OfferCard({super.key, this.offer, this.child});

  Color get _mainBackgroundColor =>
      offer == null
          ? AppColors.white
          : offer!.isPopular
          ? AppColors.orangeGradiant4
          : AppColors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.large),
      decoration: BoxDecoration(
        color: _mainBackgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: const [BoxShadow(color: AppColors.grey, blurRadius: 2)],
      ),
      child: child,
    );
  }
}
