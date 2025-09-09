import 'package:my_telco/features/offers/data/models/offer.dart';

abstract interface class ILocalOffersDataService {
  Future<List<Offer>> getOffers();
}

class LocalOffersDataService implements ILocalOffersDataService {
  @override
  Future<List<Offer>> getOffers() async {
    return [];
  }
}
