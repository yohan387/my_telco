import 'package:my_telco/features/offers/data/models/offer.dart';
import 'package:my_telco/features/subscriptions/data/models/active_pass.dart';

abstract interface class ILocalSubscriptionDataService {
  Future<List<Subscription>> getActivePasses();
  Future<void> subscribeToOffer(Offer offer);
  Future<void> cancelPass();
}

class LocalSubscriptionDataService implements ILocalSubscriptionDataService {
  @override
  Future<List<Subscription>> getActivePasses() async {
    return [];
  }

  @override
  Future<void> subscribeToOffer(Offer offer) async {
    return;
  }

  @override
  Future<void> cancelPass() async {
    return;
  }
}
