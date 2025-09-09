import 'package:my_telco/features/history/data/models/consumption_record.dart';

abstract interface class ILocalHistoryDataService {
  Future<List<ConsumptionRecord>> getConsumptionHistory();
}

class LocalHistoryDataService implements ILocalHistoryDataService {
  @override
  Future<List<ConsumptionRecord>> getConsumptionHistory() async {
    return [];
  }
}
