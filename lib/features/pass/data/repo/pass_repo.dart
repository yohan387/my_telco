import 'package:my_telco/core/mixins/repositories_mixin.dart';
import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/pass/data/models/pass_group.dart';
import 'package:my_telco/features/pass/data/services/local_service.dart';

abstract interface class IPassRepo {
  FutureResult<PassGroup> getPasses();
  FutureVoidResult cancelPass(int passId);
}

class PassRepo with RepositoriesMixin implements IPassRepo {
  final ILocalPassDataService _localPassDataService;

  PassRepo(this._localPassDataService);

  @override
  FutureResult<PassGroup> getPasses() async {
    return executeWithFailureHandling(() async {
      return await _localPassDataService.getPasses();
    });
  }

  @override
  FutureVoidResult cancelPass(int passId) async {
    return executeWithFailureHandling(() async {
      return await _localPassDataService.cancelPass(passId);
    });
  }
}
