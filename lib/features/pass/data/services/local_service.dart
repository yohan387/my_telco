import 'dart:convert';

import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/shared_preferences_keys.dart';
import 'package:my_telco/core/mixins/local_source_mixin.dart';
import 'package:my_telco/features/common/ui/entities/pass.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ILocalPassDataService {
  Future<List<Pass>> getPasses();
  Future<void> cancelPass(int passId);
}

class LocalPassDataService
    with LocalSourceMixin
    implements ILocalPassDataService {
  final SharedPreferences _prefs;

  LocalPassDataService(this._prefs);

  @override
  Future<List<Pass>> getPasses() async {
    return executeWithLocalExceptionHandler(() async {
      final jsonList = _prefs.getStringList(SharedPrefKey.pass) ?? [];

      return jsonList.map((jsonString) {
        final Map<String, dynamic> json = jsonDecode(jsonString);

        final Map<String, dynamic> offerJson = jsonDecode(json['offer']);
        final offerType = OfferType.values.byName(offerJson['type']);

        final offer = Offer(
          id: offerJson['id'],
          name: offerJson['name'],
          description: offerJson['description'],
          price: offerJson['price'],
          validityDaysNumber: offerJson['validityDaysNumber'],
          type: offerType,
          isAvailable: offerJson['isAvailable'],
          isPopular: offerJson['isPopular'],
          specialIndication: offerJson['specialIndication'],
          features: List<String>.from(offerJson['features'] ?? []),
        );

        return Pass(
          id: json['id'],
          offer: offer,
          activationDate: DateTime.fromMillisecondsSinceEpoch(
            json['activationDate'],
          ),
          expirationDate: DateTime.fromMillisecondsSinceEpoch(
            json['expirationDate'],
          ),
        );
      }).toList();
    }, sources: [LocalSourceOption.sharedPref]);
  }

  @override
  Future<void> cancelPass(int passId) async {
    return executeWithLocalExceptionHandler(() async {
      final jsonList = _prefs.getStringList(SharedPrefKey.pass) ?? [];

      final updatedList =
          jsonList.where((jsonString) {
            final Map<String, dynamic> json = jsonDecode(jsonString);
            return json['id'] != passId;
          }).toList();

      await _prefs.setStringList(SharedPrefKey.pass, updatedList);
    }, sources: [LocalSourceOption.sharedPref]);
  }
}
