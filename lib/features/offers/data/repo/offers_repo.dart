import 'package:my_telco/core/mixins/repositories_mixin.dart';
import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/offers/data/models/offer.dart';
import 'package:my_telco/features/offers/data/services/local_service.dart';

class OffersRepo with RepositoriesMixin {
  final ILocalOffersDataService localOffersDataService;

  OffersRepo({required this.localOffersDataService});

  FutureResult<List<Offer>> getAvailableOffers() async {
    return executeWithFailureHandling(() async {
      return await localOffersDataService.getOffers();
    });
  }
}
