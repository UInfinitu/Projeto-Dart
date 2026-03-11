import 'package:test/test.dart';

import 'package:projeto_integrador/models/evaluation.dart';
import 'package:projeto_integrador/models/enums.dart';

void main() {
  final json = {
    'id': 'rev-789',
    'user_id': 'usr-4f8a',
    'cache_point_id': 'cp-123',
    'grade': 5,
    'comment': 'Lugar incrível e muito bem escondido!',
    'evaluated_at': '2024-10-21T09:15:00.000Z',
  };

  final evaluation = Evaluation.fromJson(json);

  group('Testando métodos da classe Evaluation\n', () {
    test('Criando Evaluation a partir de JSON', () {
      expect(evaluation.id, 'rev-789');
      expect(evaluation.userId, 'usr-4f8a');
      expect(evaluation.cachePointId, 'cp-123');
      expect(evaluation.comment, 'Lugar incrível e muito bem escondido!');
      expect(evaluation.evaluatedAt, DateTime.parse('2024-10-21T09:15:00.000Z'));
      expect(evaluation.grade, isA<Grade>());
    });

    test('Convertendo Evaluation para JSON', () {
      final evaluationToJson = evaluation.toJson();

      expect(evaluationToJson['id'], 'rev-789');
      expect(evaluationToJson['user_id'], 'usr-4f8a');
      expect(evaluationToJson['cache_point_id'], 'cp-123');
      expect(evaluationToJson['grade'], isNotNull);
      expect(evaluationToJson['comment'], 'Lugar incrível e muito bem escondido!');
      expect(evaluationToJson['evaluated_at'], '2024-10-21T09:15:00.000Z');
    });

    test('Criando Evaluation com copyWith', () {
      final evaluationCopy = evaluation.copyWith(
        comment: 'Mudei de ideia, a trilha estava difícil.',
        grade: Grade.fromInt(3),
      );

      expect(evaluationCopy.id, evaluation.id);
      expect(evaluationCopy.userId, evaluation.userId);
      expect(evaluationCopy.cachePointId, evaluation.cachePointId);
      expect(evaluationCopy.grade, isNot(evaluation.grade));
      expect(evaluationCopy.comment, 'Mudei de ideia, a trilha estava difícil.');
      expect(evaluationCopy.evaluatedAt, evaluation.evaluatedAt);
    });
  });
}