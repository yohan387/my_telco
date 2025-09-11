import 'package:my_telco/core/mixins/repositories_mixin.dart';
import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';
import 'package:my_telco/features/offer/data/services/local_service.dart';
import 'package:my_telco/features/offer/domain/repo/offer_repo.dart';

class OfferRepo with RepositoriesMixin implements IOfferRepo {
  final ILocalOfferDataService _localOffersDataService;

  OfferRepo(this._localOffersDataService);

  @override
  FutureResult<List<Offer>> getOffers() async {
    return executeWithFailureHandling(() async {
      return await _localOffersDataService.getOffers();
    });
  }

  @override
  FutureVoidResult subscribeToOffer(Offer offer) {
    return executeWithFailureHandling(() async {
      return await _localOffersDataService.subscribeToOffer(offer);
    });
  }
}
