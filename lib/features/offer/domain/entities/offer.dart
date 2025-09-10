import 'package:equatable/equatable.dart';

import 'package:my_telco/core/constants/enums.dart';

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

  String get validityDays => validityDaysNumber == 1
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
