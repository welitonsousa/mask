import 'package:flutter/services.dart';
import 'package:mask/mask/generic_maks.dart';
import 'package:mask/mask/money_mask.dart';
import 'package:mask/validations/validations.dart';

class Mask {
  static TextInputFormatter cpf() {
    return GenericMask(mask: ['###.###.###-##']);
  }

  static TextInputFormatter cnpj() {
    return GenericMask(mask: ['##.###.###/####-##']);
  }

  static TextInputFormatter cpfOrCnpj() {
    return GenericMask(mask: ['###.###.###-##', '##.###.###/####-##']);
  }

  static TextInputFormatter money({
    int decimalLenght = 2,
    String decimal = '.',
    String fracion = ',',
    String moneySymbol = r'R$',
  }) {
    return MoneyMask(
      decimalLenght: decimalLenght,
      decimal: decimal,
      fracion: fracion,
      moneySymbol: moneySymbol,
    );
  }

  static TextInputFormatter date() {
    return GenericMask(mask: ['##/##/####']);
  }

  static TextInputFormatter phone() {
    return GenericMask(mask: ['(##) ####-####', '(##) # ####-####']);
  }

  static TextInputFormatter generic({
    required List<String> masks,
    bool hasLetters = false,
    hasNumbers = true,
  }) {
    return GenericMask(
      mask: masks,
      hasLetters: hasLetters,
      hasNumbers: hasNumbers,
    );
  }

  static Validations get validations => Validations();
}
