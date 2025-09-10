import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';

abstract interface class ILocalOfferDataService {
  Future<List<Offer>> getOffers();
}

class LocalOfferDataService implements ILocalOfferDataService {
  @override
  Future<List<Offer>> getOffers() async {
    final String response =
        await rootBundle.loadString('assets/mock_data/forfaits.json');

    final List<dynamic> data = jsonDecode(response);

    return data.map((item) {
      final type = item['type'] as String;
      final offerType = type == 'pass_internet'
          ? OfferType.internet
          : type == 'pass_appels'
              ? OfferType.voice
              : type == 'pass_premium'
                  ? OfferType.premium
                  : OfferType.weekend;

      final List<String> featuresString =
          (item['fonctionnalites'] as List<dynamic>).cast<String>().toList();

      return Offer(
        id: item['id'] as String,
        name: item['nom_offre'] as String,
        description: item['description'] as String,
        price: item['prix'] as int,
        validityDaysNumber: item['nombre_de_jours_de_validite'] as int,
        type: offerType,
        isAvailable: item['est_disponible'] as bool,
        isPopular: item['est_populaire'] as bool,
        specialIndication: item['indication_speciale'] as String?,
        features: featuresString,
      );
    }).toList();
  }
}
