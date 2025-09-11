import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';

abstract interface class IOfferRepo {
  FutureResult<List<Offer>> getOffers();
  FutureVoidResult subscribeToOffer(Offer offer);
}
