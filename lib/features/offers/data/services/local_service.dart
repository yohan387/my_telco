import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/features/offers/data/models/offer.dart';

abstract interface class ILocalOffersDataService {
  Future<List<Offer>> getOffers();
}

class LocalOffersDataService implements ILocalOffersDataService {
  @override
  Future<List<Offer>> getOffers() async {
    final String response =
        await rootBundle.loadString('assets/mock_data/forfaits.json');

    final List<dynamic> data = jsonDecode(response);

    return data.map((item) {
      final type = item['type'] as String;
      final offerType = type == 'data'
          ? OfferType.data
          : type == 'appel'
              ? OfferType.voice
              : OfferType.mixed;

      return Offer(
        id: item['id'] as String,
        name: item['nom_offre'] as String,
        description: item['description'] as String,
        price: item['prix'] as int,
        validityDays: item['validite'] as int,
        type: offerType,
        isAvailable: item['est_disponible'] as bool,
        isPopular: item['est_populaire'] as bool,
      );
    }).toList();
  }
}
