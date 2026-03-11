import 'package:test/test.dart';

import 'package:projeto_integrador/models/cachepoint.dart';
import 'package:projeto_integrador/models/enums.dart';

void main() {
  final json = {
    'id': 'cp-123',
    'title': 'Tesouro do Museu',
    'description': 'Um cache escondido perto do dinossauro.',
    'latitude': -23.5505,
    'longitude': -46.6333,
    'difficulty_level': 'medium',
    'qr_code_content': 'secret-code-001',
    'qr_code_image_url': 'https://api.qr/123.png',
    'creator_id': 'usr-4f8a',
    'created_at': '2026-03-10T14:00:00.000Z',
    'status': 'active',
  };

  final cachePoint = CachePoint.fromJson(json);

  group('Testando métodos da classe CachePoint\n', () {
    test('Criando CachePoint a partir de JSON', () {
      expect(cachePoint.id, 'cp-123');
      expect(cachePoint.title, 'Tesouro do Museu');
      expect(cachePoint.description, 'Um cache escondido perto do dinossauro.');
      expect(cachePoint.latitude, -23.5505);
      expect(cachePoint.longitude, -46.6333);
      expect(cachePoint.dificultyLevel, isA<DificultyLevel>());
      expect(cachePoint.qrCodeContent, 'secret-code-001');
      expect(cachePoint.qrCodeImageUrl, 'https://api.qr/123.png');
      expect(cachePoint.creatorId, 'usr-4f8a');
      expect(cachePoint.createdAt, DateTime.parse('2026-03-10T14:00:00.000Z'));
      expect(cachePoint.status, isA<CachePointStatus>());
    });

    test('Convertendo CachePoint para JSON', () {
      final cacheToJson = cachePoint.toJson();

      expect(cacheToJson['id'], 'cp-123');
      expect(cacheToJson['title'], 'Tesouro do Museu');
      expect(cacheToJson['description'], 'Um cache escondido perto do dinossauro.');
      expect(cacheToJson['latitude'], -23.5505);
      expect(cacheToJson['longitude'], -46.6333);
      expect(cacheToJson.containsKey('difficulty_level'), isTrue);
      expect(cacheToJson['qr_code_content'], 'secret-code-001');
      expect(cacheToJson['qr_code_image_url'], 'https://api.qr/123.png');
      expect(cacheToJson['creator_id'], 'usr-4f8a');
      expect(cacheToJson['created_at'], '2026-03-10T14:00:00.000Z');
      expect(cacheToJson.containsKey('status'), isTrue);
    });

    test('Testando a funcionalidade do copyWith', () {
      final cacheCopy = cachePoint.copyWith(
        title: 'Tesouro da Esmeralda',
        status: CachePointStatus.inactive,
      );

      expect(cacheCopy.id, cachePoint.id);
      expect(cacheCopy.title, 'Tesouro da Esmeralda');
      expect(cacheCopy.description, cachePoint.description);
      expect(cacheCopy.latitude, cachePoint.latitude);
      expect(cacheCopy.longitude, cachePoint.longitude);
      expect(cacheCopy.dificultyLevel, cachePoint.dificultyLevel);
      expect(cacheCopy.qrCodeContent, cachePoint.qrCodeContent);
      expect(cacheCopy.qrCodeImageUrl, cachePoint.qrCodeImageUrl);
      expect(cacheCopy.creatorId, cachePoint.creatorId);
      expect(cacheCopy.createdAt, cachePoint.createdAt);
      expect(cacheCopy.status, CachePointStatus.inactive);
    });
  });
}