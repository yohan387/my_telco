import 'package:equatable/equatable.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';

class Pass extends Equatable {
  final String id;
  final Offer offer;
  final DateTime activationDate;
  final DateTime expirationDate;

  const Pass({
    required this.id,
    required this.offer,
    required this.activationDate,
    required this.expirationDate,
  });

  @override
  List<Object?> get props => [id, offer, activationDate, expirationDate];
}
