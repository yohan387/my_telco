import 'package:my_telco/core/mixins/repositories_mixin.dart';
import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/offers/data/models/offer.dart';
import 'package:my_telco/features/subscriptions/data/models/active_pass.dart';
import 'package:my_telco/features/subscriptions/data/services/local_service.dart';

class SubscriptionRepo with RepositoriesMixin {
  final ILocalSubscriptionDataService localSubscriptionDataService;

  SubscriptionRepo({required this.localSubscriptionDataService});

  FutureResult<List<Subscription>> getActivePasses() async {
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
