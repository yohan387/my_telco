import 'package:my_telco/core/mixins/repositories_mixin.dart';
import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/history/domain/entities/consumption_record.dart';
import 'package:my_telco/features/history/data/services/local_service.dart';
import 'package:my_telco/features/history/domain/repo/history_repo.dart';

class HistoryRepo with RepositoriesMixin implements IHistoryRepo {
  final ILocalHistoryDataService _localHistoryDataService;

  HistoryRepo(this._localHistoryDataService);

  @override
  FutureResult<List<ConsumptionRecord>> getConsumptionHistory() async {
    return executeWithFailureHandling(() async {
      return await _localHistoryDataService.getConsumptionHistory();
    });
  }
}
