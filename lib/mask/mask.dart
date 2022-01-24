import 'package:flutter/services.dart';
import 'package:mask/mask/generic_maks.dart';
import 'package:mask/mask/money_mask.dart';
import 'package:mask/validations/validations.dart';

class Mask {
  /// use to format cpf fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   inputFormatters: [Mask.cpf()],
  /// ),
  /// ```
  static TextInputFormatter cpf() {
    return GenericMask(mask: ['###.###.###-##']);
  }

  /// use to format creditCard fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   inputFormatters: [Mask.creditCard()],
  /// ),
  /// ```
  static TextInputFormatter creditCard() {
    return GenericMask(mask: ['##### ##### ##### #####']);
  }

  /// use to format cnpj fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   inputFormatters: [Mask.cnpj()],
  /// ),
  /// ```
  static TextInputFormatter cnpj() {
    return GenericMask(mask: ['##.###.###/####-##']);
  }

  /// use to format cpfOrCnpj fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   inputFormatters: [Mask.cpfOrCnpj()],
  /// ),
  /// ```
  static TextInputFormatter cpfOrCnpj() {
    return GenericMask(mask: ['###.###.###-##', '##.###.###/####-##']);
  }

  /// use to format money fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   inputFormatters: [Mask.money()],
  /// ),
  /// ```
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

  /// use to format date fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   inputFormatters: [Mask.date()],
  /// ),
  /// ```
  static TextInputFormatter date() {
    return GenericMask(mask: ['##/##/####']);
  }

  /// use to format phone fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   inputFormatters: [Mask.phone()],
  /// ),
  /// ```
  static TextInputFormatter phone() {
    return GenericMask(mask: ['(##) ####-####', '(##) # ####-####']);
  }

  /// use to format date fields
  /// ```dart
  /// TextFormField(
  ///   autovalidateMode: AutovalidateMode.onUserInteraction,
  ///   inputFormatters: [
  ///     Mask.generic(
  ///       masks: ['##-#', '###-#'] // use your custom masks
  ///       hasNumbers: true, // optional field
  ///       hasLetters: false, // optional field
  ///     ),
  ///   ],
  /// ),
  /// ```
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
