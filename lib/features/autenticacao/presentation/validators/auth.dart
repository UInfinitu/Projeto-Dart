class AuthValidators {
  AuthValidators._();

  static String? required(String? value, {String fieldName = 'Este campo'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName é obrigatório';
    }
    return null;
  }

  static String? email(String? value) {
    final requiredError = required(value, fieldName: 'O e-mail');
    if (requiredError != null) return requiredError;

    final regex = RegExp(r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value!.trim())) {
      return 'Informe um e-mail válido (ex: usuario@email.com)';
    }
    return null;
  }

  static String? loginPassword(String? value) {
    final requiredError = required(value, fieldName: 'A senha');
    if (requiredError != null) return requiredError;

    if (value!.length < 6) {
      return 'A senha deve ter no mínimo 6 caracteres';
    }
    return null;
  }

  static String? registerPassword(String? value) {
    final requiredError = required(value, fieldName: 'A senha');
    if (requiredError != null) return requiredError;

    if (value!.length < 8) return 'A senha deve ter no mínimo 8 caracteres';
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Inclua ao menos uma letra maiúscula';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Inclua ao menos um número';
    }
    return null;
  }

  static String? Function(String?) confirmPassword(String originalPassword) {
    return (String? value) {
      final requiredError = required(
        value,
        fieldName: 'A confirmação de senha',
      );
      if (requiredError != null) return requiredError;
      if (value != originalPassword) return 'As senhas não coincidem';
      return null;
    };
  }
}
