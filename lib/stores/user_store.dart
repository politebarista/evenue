import 'dart:convert';

import 'package:evenue/features/city_choice/city_choice_user_store.dart';
import 'package:evenue/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userKey = 'user';
const selectedCityKey = 'selectedCity';

/// Before using the class, it must be opened using the [open] method
class UserStore extends CityChoiceUserStore {
  late final SharedPreferences _sharedPrefs;

  User? _user;
  String? _selectedCityId;

  User? get user => _user;

  String? get selectedCityId => _selectedCityId;

  Future<void> open() async {
    _sharedPrefs = await SharedPreferences.getInstance();

    _user = _sharedPrefs.getString(userKey) != null
        ? jsonDecode(_sharedPrefs.getString(userKey)!)
        : null;
    _selectedCityId = _sharedPrefs.getString(selectedCityKey);
  }

  Future<void> setUser(final User? user) async {
    await _setPrefsValue(userKey, jsonEncode(user));
    _user = user;
  }

  Future<void> setSelectedCityId(final String? selectedCityId) async {
    await _setPrefsValue(selectedCityKey, selectedCityId);
    _selectedCityId = selectedCityId;
  }

  Future<void> _setPrefsValue(
    final String valueKey,
    final String? value,
  ) async {
    if (value == null) {
      // ignore: avoid-ignoring-return-values
      await _sharedPrefs.remove(valueKey);
    } else {
      // ignore: avoid-ignoring-return-values
      await _sharedPrefs.setString(valueKey, value);
    }
  }
}
