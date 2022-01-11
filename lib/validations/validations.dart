import 'dart:math';

import 'modules/validation_cnpj.dart';
import 'modules/validation_cpf.dart';

class Validations {
  String? cpf(String? value, {String error = 'CPF inválido'}) {
    String numbers = CPFValidator.strip(value ?? "");
    if (numbers.length != 11 || !CPFValidator.isValid(value ?? "")) {
      return error;
    }
  }

  String? cnpj(String? value, {String error = 'CNPJ inválido'}) {
    String numbers = CNPJValidator.strip(value ?? "");
    if (numbers.length != 11 || !CNPJValidator.isValid(value ?? "")) {
      return error;
    }
  }

  String? cpfOrCnpj(
    String? value, {
    String errorCPF = 'CPF inválido',
    String errorCNPJ = 'CNPJ inválido',
  }) {
    String? response = cpf(value, error: errorCPF);
    if (response != null) response = cnpj(value, error: errorCNPJ);
    return response;
  }

  String? money(
    String? value, {
    String error = 'Valor inválido',
    double min = 1,
    int decimalLenght = 2,
  }) {
    String formatted = (value ?? "").replaceAll(RegExp(r'\D'), '');
    double money = double.parse(formatted) / pow(10, decimalLenght);

    if (money < min) {
      return error;
    }
  }

  String? email(String? value, {String error = 'Email inválido'}) {
    String emailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (!RegExp(emailRegex).hasMatch(value ?? "")) return error;
  }

  String? generic(
    String? value, {
    String error = 'Campo invaído',
    int min = 1,
  }) {
    if ((value ?? "").trim().length < min) return error;
    return null;
  }

  String? phone(String? value, {String error = 'Telefone inválido'}) {
    final number = (value ?? "").replaceAll(RegExp(r'[^0-9]'), '');
    if (number.trim().length < 10) return error;
    return null;
  }

  String? date(
    String? value, {
    String error = 'Data inválida',
    DateTime? min,
    DateTime? max,
  }) {
    if (value?.length != 10) {
      return error;
    } else {
      bool validate = true;
      final dateString = value!.split('/').reversed.join('-');
      DateTime date = DateTime.parse(dateString);

      final values = value.split('/');
      validate = validate && values[2] == '${date.year}'.padLeft(4, '0');
      validate = validate && values[1] == '${date.month}'.padLeft(2, '0');
      validate = validate && values[0] == '${date.day}'.padLeft(2, '0');

      bool rangeMin = (min?.compareTo(date) ?? -2) >= 0;
      bool rangeMax = (max?.compareTo(date) ?? 2) <= 0;
      if (!validate || rangeMax || rangeMin) return error;
    }
  }
}
