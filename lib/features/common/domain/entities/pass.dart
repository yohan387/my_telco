import 'package:equatable/equatable.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';

class Pass extends Equatable {
  final int id;
  final Offer offer;
  final DateTime activationDate;
  final DateTime expirationDate;

  const Pass({
    required this.id,
    required this.offer,
    required this.activationDate,
    required this.expirationDate,
  });

  int get validityDays => expirationDate.difference(activationDate).inDays;

  DateTime get _today => DateTime.now();

  int get remainingDaysValue {
    final int value = expirationDate.difference(_today).inDays;
    return value.isNegative ? 0 : value;
  }

  String get remainingDaysLabel =>
      '${remainingDaysValue.toString().padLeft(2, '0')} Jours';

  String get statusLabel => remainingDaysValue <= 0 ? "Inactif" : "Actif";

  @override
  List<Object?> get props => [id, offer, activationDate, expirationDate];
}
