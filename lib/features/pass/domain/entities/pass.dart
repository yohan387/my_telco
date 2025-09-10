// domain/entities/active_pass.dart

import 'package:equatable/equatable.dart';
import 'package:my_telco/features/offers/data/models/offer.dart';

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
