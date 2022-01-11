import 'package:flutter/services.dart';

class GenericMask extends TextInputFormatter {
  final List<String> mask;
  final bool hasNumbers;
  final bool hasLetters;
  int maskPosition = 0;
  String _regexp = '';

  GenericMask({
    required this.mask,
    this.hasLetters = false,
    this.hasNumbers = true,
  }) {
    if (hasNumbers) _regexp += '0-9';
    if (hasLetters) _regexp += 'a-zA-Z';
    _regexp = '[^$_regexp]';
  }

  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    String value = newValue.text.replaceAll(RegExp(_regexp), '');
    late String formatted;

    for (int i = 0; i < mask.length; i++) {
      int count = mask[i].split('').where((element) => element == '#').length;
      if (count >= value.length) {
        maskPosition = i;
        break;
      }
    }
    formatted = mask[maskPosition];
    for (var i = 0; i < value.length; i++) {
      formatted = formatted.replaceFirst('#', value[i]);
    }

    final lastHash = formatted.indexOf('#');

    if (lastHash != -1) {
      formatted = formatted.split('').getRange(0, lastHash).join();
      if (RegExp(r'\W$').hasMatch(formatted)) {
        formatted = formatted.substring(0, formatted.length - 1);
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
