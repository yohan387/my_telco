import 'package:equatable/equatable.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/core/constants/style.dart';

class Offer extends Equatable {
  final String id;
  final String name;
  final String description;
  final int price;
  final int validityDaysNumber;
  final OfferType type;
  final bool isAvailable;
  final bool isPopular;
  final String? specialIndication;
  final List<String> features;

  const Offer({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.validityDaysNumber,
    required this.type,
    required this.isAvailable,
    required this.isPopular,
    this.specialIndication,
    this.features = const [],
  });

  static const double _iconSize = 24.0;

  AppIcon get icon {
    switch (type) {
      case OfferType.voice:
        return const AppIcon(
          imgPath: AppAssetsSvgIcons.callOrange,
          color: AppColors.orangeGradiant3,
          size: _iconSize,
        );
      case OfferType.internet:
        if (isPopular) {
          return const AppIcon(
            imgPath: AppAssetsSvgIcons.all,
            color: AppColors.orangeGradiant3,
            size: _iconSize,
          );
        }
        return const AppIcon(
          imgPath: AppAssetsSvgIcons.doubleArrow,
          color: AppColors.orangeGradiant3,
          size: _iconSize,
        );
      case OfferType.premium:
        return const AppIcon(
          imgPath: AppAssetsSvgIcons.all,
          color: AppColors.orangeGradiant3,
          size: _iconSize,
        );
      case OfferType.weekend:
        return const AppIcon(
          imgPath: AppAssetsSvgIcons.wifiOrange,
          color: AppColors.orangeGradiant3,
          size: _iconSize,
        );
    }
  }

  String get validityDays =>
      validityDaysNumber == 1
          ? "$validityDaysNumber Jour"
          : "$validityDaysNumber Jours";

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    price,
    validityDaysNumber,
    type,
    isAvailable,
    isPopular,
    specialIndication,
    features,
  ];
}
