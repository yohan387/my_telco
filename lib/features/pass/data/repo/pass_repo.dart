import 'package:my_telco/core/mixins/repositories_mixin.dart';
import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';
import 'package:my_telco/features/common/ui/entities/pass.dart';
import 'package:my_telco/features/pass/data/services/local_service.dart';

class SubscriptionRepo with RepositoriesMixin {
  final ILocalSubscriptionDataService localSubscriptionDataService;

  SubscriptionRepo({required this.localSubscriptionDataService});

  FutureResult<List<Pass>> getActivePasses() async {
    return executeWithFailureHandling(() async {
      return await localSubscriptionDataService.getActivePasses();
    });
  }

  FutureVoidResult subscribeToOffer(Offer offer) async {
    return executeWithFailureHandling(() async {
      return await localSubscriptionDataService.subscribeToOffer(offer);
    });
  }

  FutureVoidResult cancelPass() async {
    return executeWithFailureHandling(() async {
      return await localSubscriptionDataService.cancelPass();
    });
  }
}
