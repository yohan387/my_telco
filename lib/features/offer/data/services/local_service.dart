import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/shared_preferences_keys.dart';
import 'package:my_telco/core/mixins/local_source_mixin.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ILocalOfferDataService {
  Future<List<Offer>> getOffers();
  Future<void> subscribeToOffer(Offer offer);
}

class LocalOfferDataService
    with LocalSourceMixin
    implements ILocalOfferDataService {
  final SharedPreferences _prefs;

  LocalOfferDataService(this._prefs);

  @override
  Future<List<Offer>> getOffers() async {
    return executeWithLocalExceptionHandler(() async {
      final String response = await rootBundle.loadString(
        'assets/mock_data/forfaits.json',
      );

      final List<dynamic> data = jsonDecode(response);

      return data.map((item) {
        final type = item['type'] as String;
        final offerType =
            type == 'pass_internet'
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
    }, sources: [LocalSourceOption.json]);
  }

  @override
  Future<void> subscribeToOffer(Offer offer) {
    return executeWithLocalExceptionHandler(() async {
      final jsonList = _prefs.getStringList(SharedPrefKey.pass) ?? [];

      final encodedOffer = jsonEncode({
        "id": offer.id,
        "name": offer.name,
        "description": offer.description,
        "price": offer.price,
        "validityDaysNumber": offer.validityDaysNumber,
        "type": offer.type.name,
        "isAvailable": offer.isAvailable,
        "isPopular": offer.isPopular,
        "specialIndication": offer.specialIndication,
        "features": offer.features,
      });

      final int newPassId = jsonList.length + 1;
      final DateTime activationDate = DateTime.now();
      final DateTime expirationDate = activationDate.add(
        Duration(days: offer.validityDaysNumber),
      );

      final newPass = jsonEncode({
        'id': newPassId,
        'offer': encodedOffer,
        'activationDate': activationDate.millisecondsSinceEpoch,
        'expirationDate': expirationDate.millisecondsSinceEpoch,
      });

      jsonList.add(newPass);

      await _prefs.setStringList(SharedPrefKey.pass, jsonList);
    }, sources: [LocalSourceOption.sharedPref]);
  }
}
