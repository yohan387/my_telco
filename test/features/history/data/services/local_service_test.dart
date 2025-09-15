import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/services.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/features/history/data/models/consumption_record.dart';
import 'package:my_telco/features/history/data/services/local_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LocalHistoryDataService', () {
    late LocalHistoryDataService service;

    setUp(() {
      service = LocalHistoryDataService();
    });

    test(
      'getConsumptionHistory should return parsed list of ConsumptionRecord',
      () async {
        // Arrange: on mock le contenu du JSON
        const fakeJson = '''
          {
            "history": [
              {
                "id": "1",
                "type": "appel",
                "donnees_utilisees": "12 min",
                "date": "2025-09-05T09:15:00Z",
                "details": "A : +2250700000000"
              },
              {
                "id": "2",
                "type": "data",
                "donnees_utilisees": "45 MB utilisés",
                "date": "2025-09-06T10:30:00Z",
                "details": "Navigation internet - YouTube"
              }
            ]
          }
      ''';

        // Mock rootBundle.loadString pour retourner notre fakeJson
        const channel = StringCodec();
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMessageHandler('flutter/assets', (message) async {
              final key = channel.decodeMessage(message);
              if (key == 'assets/mock_data/historique.json') {
                return channel.encodeMessage(fakeJson);
              }
              return null;
            });

        // Act
        final result = await service.getConsumptionHistory();

        // Assert
        expect(result, isA<List<ConsumptionRecord>>());
        expect(result.length, 2);

        final first = result.first;
        expect(first.id, '1');
        expect(first.type, ConsumptionType.call);
        expect(first.dataUsage, '12 min');
        expect(first.details, 'A : +2250700000000');
      },
    );
  });
}
