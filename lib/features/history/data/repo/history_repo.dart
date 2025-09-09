import 'package:my_telco/core/mixins/repositories_mixin.dart';
import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/history/data/models/consumption_record.dart';
import 'package:my_telco/features/history/data/services/local_service.dart';

class HistoryRepo with RepositoriesMixin {
  final ILocalHistoryDataService localHistoryDataService;

  HistoryRepo({required this.localHistoryDataService});

  FutureResult<List<ConsumptionRecord>> getConsumptionHistory() async {
    return executeWithFailureHandling(() async {
      return await localHistoryDataService.getConsumptionHistory();
    });
  }
}
