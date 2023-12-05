extension DynamicExtension on Map<String, dynamic> {
  double convertToDouble(String key) {
    try {
      double parseValue = double.parse(this[key]);
      return parseValue;
    } catch (_) {
      try {
        double parseValue = (this[key] as num).toDouble();
        return parseValue;
      } catch (_) {
        return 0.0;
      }
    }
  }

  int convertToInt(String key) {
    try {
      int parseValue = int.parse(this[key]);
      return parseValue;
    } catch (_) {
      try {
        int parseValue = (this[key] as num).toInt();
        return parseValue;
      } catch (_) {
        return 0;
      }
    }
  }

  String convertToString(String key) {
    try {
      String parseValue = this[key] ?? '';
      return parseValue;
    } catch (_) {
      return '';
    }
  }

  bool convertToBool(String key, {defaultValue = false}) {
    return this[key] ?? defaultValue;
  }

  Map<String, dynamic> convertToMap(String key, {defaultValue = false}) {
    try {
      final Map<String, dynamic> parseValue = this[key] as Map<String, dynamic>;
      return parseValue;
    } catch (_) {
      return {};
    }
  }

  List<Map<String, dynamic>> convertToListMap(String key) {
    try {
      final list = this[key] as List;
      final List<Map<String, dynamic>> listMap = [];
      for (var item in list) {
        final newItem = item as Map<String, dynamic>;
        listMap.add(newItem);
      }
      return listMap;
    } catch (_) {
      return [];
    }
  }
}
