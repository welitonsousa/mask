import 'dart:math' as mat;

import 'package:flutter/material.dart';

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
    double money = moneyValue / mat.pow(10, decimalLength);

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
  ///     min: DateTime.parse('1999-01-01'), // optional field
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
    if (value?.trim().length != 10) return error;

    final str = value!.replaceAll(RegExp(r'[0-9]'), '');
    if (str.length != 2) return error;
    if (str[0] != str[1]) return error;
    if (str[0] != '/' && str[0] != '-') return error;

    final special = str[0];
    final dateInt = value.split(special).map(int.parse).toList();

    final year = '${mat.max(dateInt[0], dateInt[2])}'.padLeft(4, '0');
    final month = '${dateInt[1]}'.padLeft(2, '0');
    final day = '${mat.min(dateInt[0], dateInt[2])}'.padLeft(2, '0');

    final date = DateTime.tryParse('$year$month$day');
    if (date == null) return error;

    final rangeMin = (min?.compareTo(date) ?? -2) >= 0;
    final rangeMax = (max?.compareTo(date) ?? 2) <= 0;
    if (rangeMax && max != null) return error;
    if (rangeMin && min != null) return error;

    return null;
  }

  /// use to validate time fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: (value) => Mask.validations.time(
  ///     value,
  ///     error: 'your message error', // optional field
  ///     min: TimeOfDay(hour: 8, minute: 0), // optional field
  ///     max: TimeOfDay(hour: 18, minute: 0), // optional field
  ///   ),
  /// ),
  /// ```
  ///
  ///------------   or   ------------
  ///
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: Mask.validations.time,
  /// ),
  /// ```
  String? time(
    String? value, {
    String error = 'Horário inválido',
    TimeOfDay? min,
    TimeOfDay? max,
  }) {
    final time = (value ?? '').split(':');

    if (time.length != 2) return error;
    final hours = int.tryParse(time[0]);
    final minutes = int.tryParse(time[1]);

    if (minutes == null || hours == null) return error;
    if (minutes < 0 || minutes > 59) return error;
    if (hours < 0 || hours > 23) return error;

    if (min != null) {
      if (hours < min.hour) return error;
      if (hours == min.hour && minutes < min.minute) return error;
    }
    if (max != null) {
      if (hours > max.hour) return error;
      if (hours == max.hour && minutes > max.minute) return error;
    }
    return null;
  }

  /// use to validate dateTime fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: (value) => Mask.validations.dateTime(
  ///     value,
  ///     error: 'your message error', // optional field
  ///     min: DateTime.parse('1999-01-01 08:00'), // optional field
  ///     max: DateTime.parse('1999-01-01 18:00'), // optional field
  ///     timeWithSeconds: false, // optional field
  ///   ),
  /// ),
  /// ```
  ///
  ///------------   or   ------------
  ///
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   validator: Mask.validations.dateTime,
  /// ),
  /// ```
  String? dateTime(
    String? value, {
    String error = 'Data inválida',
    DateTime? min,
    DateTime? max,
    bool timeWithSeconds = false,
  }) {
    final values = (value ?? "").split(' ');
    if (values.length != 2) return error;
    final dateSTR = values[0];
    final timeSTR = values[1];

    if (dateSTR.trim().length != 10) return error;

    if (timeWithSeconds) {
      if (timeSTR.trim().length != 8) return error;
    } else {
      if (timeSTR.trim().length != 5) return error;
    }
    final time = DateTime.tryParse('0000-00-00 $timeSTR');
    if (time == null) return error;

    final str = dateSTR.replaceAll(RegExp(r'[0-9]'), '');
    if (str.length != 2) return error;
    if (str[0] != str[1]) return error;
    if (str[0] != '/' && str[0] != '-') return error;

    final special = str[0];
    final dateInt = dateSTR.split(special).map(int.parse).toList();

    final year = '${mat.max(dateInt[0], dateInt[2])}'.padLeft(4, '0');
    final month = '${dateInt[1]}'.padLeft(2, '0');
    final day = '${mat.min(dateInt[0], dateInt[2])}'.padLeft(2, '0');

    final date = DateTime.tryParse(
        '$year$month$day ${time.hour}:${time.minute}:${time.second}');
    if (date == null) return error;

    final rangeMin = (min?.compareTo(date) ?? -2) >= 0;
    final rangeMax = (max?.compareTo(date) ?? 2) <= 0;
    if (rangeMax && max != null) return error;
    if (rangeMin && min != null) return error;

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
