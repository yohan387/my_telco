import 'package:equatable/equatable.dart';
import 'package:my_telco/core/constants/enums.dart';

class Offer extends Equatable {
  final String id;
  final String name;
  final String description;
  final int price;
  final int validityDays;
  final bool isAvailable;
  final bool isPopular;
  final OfferType type;

  const Offer({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.validityDays,
    required this.type,
    required this.isAvailable,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        validityDays,
        type,
        isAvailable,
        isPopular
      ];
}
