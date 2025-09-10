import 'package:my_telco/features/offer/domain/entities/offer.dart';
import 'package:my_telco/features/pass/domain/entities/pass.dart';

abstract interface class ILocalSubscriptionDataService {
  Future<List<Pass>> getActivePasses();
  Future<void> subscribeToOffer(Offer offer);
  Future<void> cancelPass();
}

class LocalSubscriptionDataService implements ILocalSubscriptionDataService {
  @override
  Future<List<Pass>> getActivePasses() async {
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
