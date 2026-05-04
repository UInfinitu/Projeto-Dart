class CacheValidators {
  CacheValidators._();

  static String? required(String? value, {String fieldName = 'Este campo'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName é obrigatório';
    }
    return null;
  }

  static String? address(String? value) {
    final err = required(value, fieldName: 'O endereço');
    if (err != null) return err;
    if (value!.trim().length < 10) {
      return 'Informe um endereço mais completo';
    }
    return null;
  }

  static String? description(String? value) {
    final err = required(value, fieldName: 'A descrição');
    if (err != null) return err;
    if (value!.trim().length < 20) {
      return 'A descrição deve ter no mínimo 20 caracteres';
    }
    return null;
  }

  static String? hint(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    if (value.trim().length < 5) {
      return 'A dica deve ter no mínimo 5 caracteres';
    }
    return null;
  }

  static String? Function(String?) dropdown({String fieldName = 'Este campo'}) {
    return (String? value) {
      if (value == null || value.isEmpty) return '$fieldName é obrigatório';
      return null;
    };
  }
}
