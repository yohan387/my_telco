import 'package:my_telco/core/mixins/repositories_mixin.dart';
import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/dashboard/data/services/local_data_service.dart';
import 'package:my_telco/features/dashboard/domain/entities/customer.dart';

class DashboardRepo with RepositoriesMixin {
  final ILocalDataService localDataService;

  DashboardRepo({required this.localDataService});

  FutureResult<Customer> getCustormerProfile() async {
    return executeWithFailureHandling(() async {
      return await localDataService.getCustormerProfile();
    });
  }
}
