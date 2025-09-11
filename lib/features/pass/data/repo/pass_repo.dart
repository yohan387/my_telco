import 'package:my_telco/core/mixins/repositories_mixin.dart';
import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/common/ui/entities/pass.dart';
import 'package:my_telco/features/pass/data/services/local_service.dart';

abstract interface class IPassRepo {
  FutureResult<List<Pass>> getPasses();
  FutureVoidResult cancelPass(int passId);
}

class PassRepo with RepositoriesMixin implements IPassRepo {
  final ILocalPassDataService localPassDataService;

  PassRepo({required this.localPassDataService});

  @override
  FutureResult<List<Pass>> getPasses() async {
    return executeWithFailureHandling(() async {
      return await localPassDataService.getPasses();
    });
  }

  @override
  FutureVoidResult cancelPass(int passId) async {
    return executeWithFailureHandling(() async {
      return await localPassDataService.cancelPass(passId);
    });
  }
}
