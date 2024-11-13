import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:worksheet/src/common/utils/logger.dart';

/// Global functions for configure a shared preferences.
Future<void> setPreference(String key, dynamic value) async {
  // Your test must explicit call this if it wants to use SharedPreferences
  // SharedPreferences.setMockInitialValues({});
  // await Preferences.init();
  if (!Preferences.isInitialized) throw "Preferences not initialized";

  await Preferences._set(key, value);
}

/// Get a Object type data.
getPreference(String key) {
  // See note above
  if (!Preferences.isInitialized) throw "Preferences not initialized";
  //log.d("getPreference ${key.name}");
  return Preferences._get(key);
}

Future<void> setJsonPreference(KeyPref key, dynamic value) async {
  if (!Preferences.isInitialized) throw "Preferences not initialized";
  await Preferences._setStringByName(key.name, jsonEncode(value));
}

Future<void> updateJsonPreference(KeyPref key, Map<String, dynamic> mapData) async {
  if (!Preferences.isInitialized) throw "Preferences not initialized";

  Map<String, Map<String, dynamic>> currentJson = {};

  if (containPreference(key)) {
    currentJson = {key.name: getJsonPreference(key)[key.name]};
    currentJson.update(key.name, (value) {
      value.addAll(mapData);
      return value;
    });
  } else {
    currentJson = {key.name: mapData};
  }

  await Preferences._setStringByName(key.name, jsonEncode(currentJson));
}

getJsonPreference(KeyPref key) {
  // See note above
  if (!Preferences.isInitialized) throw "Preferences not initialized";

  final String? val = Preferences._getStringByName(key.name); // jsonDecode

  if (val == null) return null;

  return jsonDecode(val);
}

bool containPreference(KeyPref key) => Preferences._pref.containsKey(key.name);

Future<void> removePreference(String key) async {
  // See note above
  if (!Preferences.isInitialized) throw "Preferences not initialized";

  await Preferences._pref.remove(key);
}

Future<void> clearPreferences() async => Preferences._pref.clear();

class Preferences {
  // fugly necessity for tests to know if Preference is initialized or not
  // there is no way to check late var has been provided
  static bool isInitialized = false;
  static late SharedPreferences _pref;

  static Future<void> init() async {
    SharedPreferences.setPrefix("harmony_prefs.");
    _pref = await SharedPreferences.getInstance();
    isInitialized = true;
  }

  static Future<void> clear() async {
    Log.d("Preferences.clear");
    await _pref.clear();
  }

  /// In this case, the use of Switch is much more efficient and reliable than using the if or Map conditional.
  static Future<void> _set(String key, dynamic value) async {
    String keyName = key;

    if (value == null) {
      await _pref.remove(keyName);
    } else {
      try {
        return switch (value.runtimeType) {
          const (String) => await _pref.setString(keyName, value),
          const (int) => await _pref.setInt(keyName, value),
          const (double) => await _pref.setDouble(keyName, value),
          const (bool) => await _pref.setBool(keyName, value),
          <String>[] => await _pref.setStringList(keyName, value),
          (_) => Log.w("The current type ${value.runtimeType} data is not supported with value $value")
        };
      } catch (error, stackTrace) {
        Log.e("Preferences._set: ${error.toString()} - ${stackTrace.toString()}");
      }
    }
  }

  static _get(String key) => _pref.get(key);

  static Future<void> _setStringByName(String key, String value) async {
    await _pref.setString(key, value);
  }

  static _getStringByName(String string) => _pref.getString(string);
}

enum KeyPref { profile, companyId, employeeInfoForm }
