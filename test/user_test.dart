import 'package:test/test.dart';

import 'package:projeto_integrador/models/user.dart';

void main() {
  final json = {
    'id': 'usr-4f8a',
    'name': 'Ana Lima',
    'email': 'ana.lima@exemplo.com',
    'created_at': '2024-09-15T10:30:00.000Z',
  };

  final user = User.fromJson(json);

  group('Testando métodos da classe User\n', () {
    test('Criando usuário a partir de JSON', () {
      expect(user.id, 'usr-4f8a');
      expect(user.name, 'Ana Lima');
      expect(user.email, 'ana.lima@exemplo.com');
      expect(user.createdAt, DateTime.parse('2024-09-15T10:30:00.000Z'));
    });

    test('Convertendo usuário para JSON', () {
      final userToJson = user.toJson();

      expect(userToJson['id'], 'usr-4f8a');
      expect(userToJson['name'], 'Ana Lima');
      expect(userToJson['email'], 'ana.lima@exemplo.com');
      expect(userToJson['created_at'], '2024-09-15T10:30:00.000Z');
    });

    test('Criando usuário com copyWith', () {
      final userCopy = user.copyWith(id: 'usr-5g9b', email: 'ana.lima2@exemplo.com');

      expect(userCopy.id, 'usr-5g9b');
      expect(userCopy.name, user.name);
      expect(userCopy.email, 'ana.lima2@exemplo.com');
      expect(userCopy.createdAt, user.createdAt);
    });
  });
}
