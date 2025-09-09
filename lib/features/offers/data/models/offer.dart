import 'package:equatable/equatable.dart';
import 'package:my_telco/core/constants/enums.dart';

class Offer extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final int validity; // in days
  final OfferType type;

  const Offer({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.validity,
    required this.type,
  });

  @override
  List<Object?> get props => [id, name, description, price, validity, type];
}
