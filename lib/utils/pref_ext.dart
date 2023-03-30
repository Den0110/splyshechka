import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

extension PrefExt on SharedPreferences {
  T? getObject<T>(String key, T Function(Map<String, dynamic>) convert) {
    final json = getString(key);
    if (json == null) return null;
    return convert(jsonDecode(json));
  }

  void setObject(String key, dynamic value) {
    setString(key, jsonEncode(value.toJson()));
  }
}