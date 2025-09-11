import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_telco/features/offer/domain/entities/offer.dart';
import 'package:my_telco/features/offer/data/services/local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LocalOfferDataService', () {
    late LocalOfferDataService service;
    late MockSharedPreferences mockPrefs;

    setUp(() {
      mockPrefs = MockSharedPreferences();
      service = LocalOfferDataService(mockPrefs);
    });

    test('getAvailableOffers should return a list of Offer from JSON',
        () async {
      // Arrange : faux contenu du fichier JSON
      const fakeJson = '''
      [
        {
          "id": "1",
          "nom_offre": "Pass Internet 5GB",
          "description": "Naviguez sans limite avec 5Go de data.",
          "prix": 3000,
          "nombre_de_jours_de_validite": 15,
          "type": "pass_internet",
          "est_disponible": true,
          "est_populaire": false,
          "indication_speciale": null,
          "fonctionnalites": [
            "5BG de data",
            "4G/5G inclus",
            "Valable 15 jours"
          ]
        },
        {
          "id": "2",
          "nom_offre": "Pass Internet 5GB",
          "description": "Naviguez sans limite avec 5GB de data.",
          "prix": 15000,
          "nombre_de_jours_de_validite": 30,
          "type": "pass_internet",
          "est_disponible": true,
          "est_populaire": true,
          "indication_speciale": "Forfait Populaire",
          "fonctionnalites": [
            "10BG de data",
            "2h d'appel",
            "1000 SMS"
          ]
        }
      ]
      ''';

      // On intercepte le canal des assets
      const channel = StringCodec();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMessageHandler('flutter/assets', (message) async {
        final key = channel.decodeMessage(message);
        if (key == 'assets/mock_data/forfaits.json') {
          return channel.encodeMessage(fakeJson);
        }
        return null;
      });

      // Act
      final result = await service.getOffers();

      // Assert
      expect(result, isA<List<Offer>>());
      expect(result.length, 2);

      final first = result.first;
      expect(first.id, "1");
      expect(first.name, "Pass Internet 5GB");
      expect(first.price, 3000);
      expect(first.isAvailable, true);
      expect(first.isPopular, false);
      expect(first.specialIndication, null);
      expect(
          first.features, ["5BG de data", "4G/5G inclus", "Valable 15 jours"]);

      final second = result[1];
      expect(second.id, "2");
      expect(second.name, "Pass Internet 5GB");
      expect(second.price, 15000);
      expect(second.isAvailable, true);
      expect(second.isPopular, true);
      expect(second.specialIndication, "Forfait Populaire");
      expect(second.features, ["10BG de data", "2h d'appel", "1000 SMS"]);
    });
  });
}
