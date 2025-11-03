import 'package:my_telco/core/mixins/repositories_mixin.dart';
import 'package:my_telco/core/typedefs.dart';
<<<<<<< HEAD
import 'package:my_telco/features/common/ui/entities/pass.dart';
import 'package:my_telco/features/pass/data/services/local_service.dart';

abstract interface class IPassRepo {
  FutureResult<List<Pass>> getPasses();
=======
import 'package:my_telco/features/pass/data/models/pass_group.dart';
import 'package:my_telco/features/pass/data/services/local_service.dart';

abstract interface class IPassRepo {
  FutureResult<PassGroup> getPasses();
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
  FutureVoidResult cancelPass(int passId);
}

class PassRepo with RepositoriesMixin implements IPassRepo {
<<<<<<< HEAD
  final ILocalPassDataService localPassDataService;

  PassRepo({required this.localPassDataService});

  @override
  FutureResult<List<Pass>> getPasses() async {
    return executeWithFailureHandling(() async {
      return await localPassDataService.getPasses();
=======
  final ILocalPassDataService _localPassDataService;

  PassRepo(this._localPassDataService);

  @override
  FutureResult<PassGroup> getPasses() async {
    return executeWithFailureHandling(() async {
      return await _localPassDataService.getPasses();
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
    });
  }

  @override
  FutureVoidResult cancelPass(int passId) async {
    return executeWithFailureHandling(() async {
<<<<<<< HEAD
      return await localPassDataService.cancelPass(passId);
=======
      return await _localPassDataService.cancelPass(passId);
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
    });
  }
}
