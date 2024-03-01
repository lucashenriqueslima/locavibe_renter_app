import 'package:get/get.dart';

class FormValidators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    if (!GetUtils.isEmail(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  static String? cpf(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!GetUtils.isCpf(value)) {
      return 'CPF inválido';
    }

    return null;
  }

  static String? cellPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (![15, 14].contains(value.length)) {
      return 'Número inválido';
    }
    return null;
  }

  static String? empty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
