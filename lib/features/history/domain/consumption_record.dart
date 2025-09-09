// domain/entities/consumption_record.dart

import 'package:equatable/equatable.dart';
import 'package:my_telco/core/constants/app_constant.dart';

class ConsumptionRecord extends Equatable {
  final String id;
  final ConsumptionType type;
  final double amount; // minutes, sms count, or MB
  final DateTime date;
  final String? details; // e.g. recipient number, call duration

  const ConsumptionRecord({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    this.details,
  });

  @override
  List<Object?> get props => [id, type, amount, date, details];
}
