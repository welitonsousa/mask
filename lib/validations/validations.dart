import 'dart:math';
import 'modules/validation_cnpj.dart';
import 'modules/validation_cpf.dart';

class Validations {
  /// use to validate cpf fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: (value) => Mask.validations.cpf(
  ///     value,
  ///     error: 'your message error', // optional field
  ///   ),
  /// ),
  /// ```
  ///
  ///------------   or   ------------
  ///
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: Mask.validations.cpf,
  /// ),
  /// ```
  String? cpf(String? value, {String error = 'CPF inválido'}) {
    String numbers = CPFValidator.strip(value ?? "");
    if (numbers.length != 11 || !CPFValidator.isValid(value ?? "")) {
      return error;
    }
    return null;
  }

  /// use to validate cnpj fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: (value) => Mask.validations.cnpj(
  ///     value,
  ///     error: 'your message error', // optional field
  ///   ),
  /// ),
  /// ```
  ///
  ///------------   or   ------------
  ///
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: Mask.validations.cnpj,
  /// ),
  /// ```
  String? cnpj(String? value, {String error = 'CNPJ inválido'}) {
    String numbers = CNPJValidator.strip(value ?? "");
    if (numbers.length != 14 || !CNPJValidator.isValid(value ?? "")) {
      return error;
    }
    return null;
  }

  /// use to validate cpfOrCnpj fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: (value) => Mask.validations.cpfOrCnpj(
  ///     value,
  ///     error: 'your message error', // optional field
  ///   ),
  /// ),
  /// ```
  ///
  ///------------   or   ------------
  ///
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: Mask.validations.cpfOrCnpj,
  /// ),
  /// ```
  String? cpfOrCnpj(
    String? value, {
    String errorCPF = 'CPF inválido',
    String errorCNPJ = 'CNPJ inválido',
  }) {
    String? response = cpf(value, error: errorCPF);
    if (response != null) response = cnpj(value, error: errorCNPJ);
    return response;
  }

  /// use to validate money fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: (value) => Mask.validations.money(
  ///     value,
  ///     min: 100.0, // optional field
  ///   ),
  /// ),
  /// ```
  ///
  ///------------   or   ------------
  ///
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: Mask.validations.money,
  /// ),
  /// ```

  String? money(
    String? value, {
    String error = 'Valor inválido',
    double min = 1,
    int decimalLength = 2,
  }) {
    String formatted = (value ?? "").replaceAll(RegExp(r'\D'), '');
    double moneyValue = double.tryParse(formatted) ?? 0;
    double money = moneyValue / pow(10, decimalLength);

    if (money < min) return error;
    return null;
  }

  /// use to validate email fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: (value) => Mask.validations.email(
  ///     value,
  ///     error: 'your message error', // optional field
  ///   ),
  /// ),
  /// ```
  ///
  ///------------   or   ------------
  ///
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: Mask.validations.email,
  /// ),
  /// ```
  String? email(String? value, {String error = 'Email inválido'}) {
    String emailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (!RegExp(emailRegex).hasMatch(value ?? "")) return error;
    return null;
  }

  /// use to validate generic fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: (value) => Mask.validations.generic(
  ///     value,
  ///     error: 'your message error', // optional field
  ///     min: 8, // optional field
  ///   ),
  /// ),
  /// ```
  ///
  ///------------   or   ------------
  ///
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: Mask.validations.generic,
  /// ),
  /// ```
  String? generic(
    String? value, {
    String error = 'Campo inválido',
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

  /// use to validate date fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: (value) => Mask.validations.date(
  ///     value,
  ///     error: 'your message error', // optional field
  ///     min: DateTime('1999-01-01'), // optional field
  ///     max: DateTime.now(), // optional field
  ///   ),
  /// ),
  /// ```
  ///
  ///------------   or   ------------
  ///
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: Mask.validations.date,
  /// ),
  /// ```
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
      final dateString = value!.replaceAll(RegExp('[^0-9]'), '');
      if (dateString.length == 8) {
        DateTime date = DateTime.parse(dateString);

        final values = value.split('/');
        validate = validate && values[2] == '${date.year}'.padLeft(4, '0');
        validate = validate && values[1] == '${date.month}'.padLeft(2, '0');
        validate = validate && values[0] == '${date.day}'.padLeft(2, '0');

        bool rangeMin = (min?.compareTo(date) ?? -2) >= 0;
        bool rangeMax = (max?.compareTo(date) ?? 2) <= 0;
        if (!validate || rangeMax || rangeMin) return error;
      } else {
        return error;
      }
    }
    return null;
  }

  /// compare two fields such as password and password confirmation
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: (value) => Mask.validations.compare(
  ///     value,
  ///     compareTo: myTextEditingController.text,
  ///     error: 'invalid confirmation' //optional field
  ///   ),
  /// ),
  /// ```

  String? compare(
    String? value, {
    String compareTo = '',
    String error = 'Compo inválido',
  }) {
    if ((value?.trim().isEmpty ?? true) || value != compareTo) return error;
    return null;
  }

  /// use to apply multiple validations
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   controller: editController,
  ///   validator: (value) => Mask.validations.multiple(
  ///     validations: [
  ///       Mask.validations.generic(value, min: 4, error: 'min 4'),
  ///       Mask.validations.email(value, error: 'email inválido'),
  ///     ],
  ///   ),
  /// ),
  /// ```

  String? multiple({
    required List<String?> validations,
  }) {
    for (var validation in validations) {
      if (validation != null) return validation;
    }
    return null;
  }
}
