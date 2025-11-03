import 'package:equatable/equatable.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/core/constants/assets.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/style.dart';

class ConsumptionRecord extends Equatable {
  final String id;
  final ConsumptionType type;
  final String dataUsage;
  final DateTime date;
  final String? details;

  const ConsumptionRecord({
    required this.id,
    required this.type,
    required this.dataUsage,
    required this.date,
    this.details,
  });

  AppIcon get icon {
    switch (type) {
      case ConsumptionType.call:
        return const AppIcon(
          imgPath: AppAssetsSvgIcons.callOrange,
          color: AppColors.orangeGradiant3,
        );
      case ConsumptionType.sms:
        return const AppIcon(
          imgPath: AppAssetsSvgIcons.smsOrange,
          color: AppColors.orangeGradiant3,
        );
      case ConsumptionType.data:
        return const AppIcon(
          imgPath: AppAssetsSvgIcons.wifiOrange,
          color: AppColors.orangeGradiant3,
        );
    }
  }

  @override
  List<Object?> get props => [id, type, dataUsage, date, details];
}
