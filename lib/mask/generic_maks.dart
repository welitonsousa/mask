import 'package:flutter/services.dart';
import 'package:mask/models/hashtag_is.dart';

String _expression({required Hashtag hashtag}) {
  String response = '';
  if (hashtag == Hashtag.letters) {
    response = '[^a-zA-Z]';
  } else if (hashtag == Hashtag.numbers) {
    response = '[^0-9]';
  } else if (hashtag == Hashtag.numbersAndLetters) {
    response = '[^0-9a-zA-Z]';
  }
  return response;
}

class GenericMask extends TextInputFormatter {
  final List<String> mask;
  final Hashtag hashtag;
  int maskPosition = 0;

  GenericMask({
    required this.mask,
    this.hashtag = Hashtag.numbers,
  });

  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    String value =
        newValue.text.replaceAll(RegExp(_expression(hashtag: hashtag)), '');
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
