// domain/entities/consumption_record.dart

import 'package:equatable/equatable.dart';
import 'package:my_telco/core/constants/enums.dart';

class ConsumptionRecord extends Equatable {
  final String id;
  final ConsumptionType type;
  final double dataUsage;
  final DateTime date;
  final String? details;

  const ConsumptionRecord({
    required this.id,
    required this.type,
    required this.dataUsage,
    required this.date,
    this.details,
  });

  @override
  List<Object?> get props => [id, type, dataUsage, date, details];
}
