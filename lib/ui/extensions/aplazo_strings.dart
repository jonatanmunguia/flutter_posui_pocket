import 'dart:convert';

extension AplazoString on String {
  String cleanPhone() {
    return replaceAll('-', '');
  }

  String cleanUnderscore() {
    return replaceAll('_', ' ');
  }

  String birthDayFormat(String original) {
    final newValue = this;
    final int newTextLength = newValue.length;

    final StringBuffer newText = StringBuffer();
    if (newTextLength == 2) {
      newText.write('${newValue.substring(0, 2)}/');
    }
    if (newTextLength == 5) {
      newText.write('${newValue.substring(0, 5)}/');
    }
    newText.write(newValue[newValue.length - 1]);

    //newText.write(newValue.substring(0, newValue.length));
    return newText.toString();
  }

  String toBase64() {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(this);
  }

  int convertToInt() {
    try {
      int parseValue = int.parse(this);
      return parseValue;
    } catch (_) {
      try {
        int parseValue = (this as num).toInt();
        return parseValue;
      } catch (_) {
        return 0;
      }
    }
  }

  String capitalizeAll() {
    if (isEmpty) {
      return '';
    }
    if (length == 0) {
      return '';
    }
    if (this == 'null') {
      return '';
    }
    String newC = this.trimLeft().trimRight();
    newC = newC.replaceAll('  ', ' ');
    final List<String> splitStr = newC.split(' ');
    for (int i = 0; i < splitStr.length; i++) {
      final String sub = splitStr[i].substring(1);
      splitStr[i] = '${splitStr[i][0].toUpperCase()}$sub';
    }
    final output = splitStr.join(' ');
    return output;
  }

  String removeDiacritics() {
    String str = this;
    var withDia =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutDia =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';
    for (int i = 0; i < withDia.length; i++) {
      str = str.replaceAll(withDia[i], withoutDia[i]);
    }
    return str;
  }
}
