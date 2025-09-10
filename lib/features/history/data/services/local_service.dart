import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/features/history/domain/entities/consumption_record.dart';

abstract interface class ILocalHistoryDataService {
  Future<List<ConsumptionRecord>> getConsumptionHistory();
}

class LocalHistoryDataService implements ILocalHistoryDataService {
  @override
  Future<List<ConsumptionRecord>> getConsumptionHistory() async {
    final String response =
        await rootBundle.loadString('assets/mock_data/historique.json');

    final data = jsonDecode(response) as Map<String, dynamic>;
    final List<dynamic> history = data['history'];

    return history
        .map(
          (item) => ConsumptionRecord(
            id: item['id'],
            type: item['type'] == 'data'
                ? ConsumptionType.data
                : item['type'] == 'appel'
                    ? ConsumptionType.call
                    : ConsumptionType.sms,
            dataUsage: item['donnees_utilisees'],
            date: DateTime.parse(item['date']),
            details: item['details'],
          ),
        )
        .toList();
  }
}
