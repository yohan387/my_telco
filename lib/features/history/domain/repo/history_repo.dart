import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/history/domain/entities/consumption_record.dart';

abstract interface class IHistoryRepo {
  FutureResult<List<ConsumptionRecord>> getConsumptionHistory();
}
