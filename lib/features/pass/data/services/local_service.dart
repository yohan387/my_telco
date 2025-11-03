import 'dart:convert';
<<<<<<< HEAD

import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/shared_preferences_keys.dart';
import 'package:my_telco/core/mixins/local_source_mixin.dart';
import 'package:my_telco/features/common/ui/entities/pass.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ILocalPassDataService {
  Future<List<Pass>> getPasses();
=======

import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/shared_preferences_keys.dart';
import 'package:my_telco/core/mixins/local_source_mixin.dart';
import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/features/common/models/pass.dart';
import 'package:my_telco/features/offer/data/models/offer.dart';
import 'package:my_telco/features/pass/data/models/pass_group.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ILocalPassDataService {
  Future<PassGroup> getPasses();
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
  Future<void> cancelPass(int passId);
}

class LocalPassDataService
    with LocalSourceMixin
    implements ILocalPassDataService {
  final SharedPreferences _prefs;

  LocalPassDataService(this._prefs);

  @override
<<<<<<< HEAD
  Future<List<Pass>> getPasses() async {
    return executeWithLocalExceptionHandler(() async {
      final jsonList = _prefs.getStringList(SharedPrefKey.pass) ?? [];

      return jsonList.map((jsonString) {
        final Map<String, dynamic> json = jsonDecode(jsonString);

        final Map<String, dynamic> offerJson = jsonDecode(json['offer']);
        final offerType = OfferType.values.byName(offerJson['type']);
=======
  Future<PassGroup> getPasses() async {
    return executeWithLocalExceptionHandler(() async {
      final jsonList = _prefs.getStringList(SharedPrefKey.pass) ?? [];

      final List<Pass> validPass = [];
      final List<Pass> expiredPass = [];

      for (final jsonString in jsonList) {
        final DynamicMap passJson = jsonDecode(jsonString);
        final DynamicMap offerJson = jsonDecode(passJson['offer']);

        final offerType = OfferType.values.byName(offerJson['type']);
        final List<String> featuresString =
            (offerJson['features'] as List<dynamic>).cast<String>().toList();
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f

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
<<<<<<< HEAD
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
=======
          features: featuresString,
        );

        final pass = Pass(
          id: passJson['id'] as int,
          offer: offer,
          activationDate: DateTime.fromMillisecondsSinceEpoch(
            passJson['activationDate'],
          ),
          expirationDate: DateTime.fromMillisecondsSinceEpoch(
            passJson['expirationDate'],
          ),
        );

        if (pass.remainingDaysValue > 0) {
          validPass.add(pass);
        } else {
          expiredPass.add(pass);
        }
      }

      return PassGroup(valid: validPass, expired: expiredPass);
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
    }, sources: [LocalSourceOption.sharedPref]);
  }

  @override
  Future<void> cancelPass(int passId) async {
    return executeWithLocalExceptionHandler(() async {
      final jsonList = _prefs.getStringList(SharedPrefKey.pass) ?? [];

      final updatedList =
          jsonList.where((jsonString) {
<<<<<<< HEAD
            final Map<String, dynamic> json = jsonDecode(jsonString);
=======
            final DynamicMap json = jsonDecode(jsonString);
>>>>>>> 5a394d0bfd9291e16a3e6c6ddb9706819f4dc51f
            return json['id'] != passId;
          }).toList();

      await _prefs.setStringList(SharedPrefKey.pass, updatedList);
    }, sources: [LocalSourceOption.sharedPref]);
  }
}
