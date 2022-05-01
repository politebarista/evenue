import 'dart:convert';

import 'package:evenue/features/city_choice/city_choice_user_store.dart';
import 'package:evenue/models/customer.dart';
import 'package:shared_preferences/shared_preferences.dart';

const customerKey = 'customer';
const selectedCityKey = 'selectedCity';

/// Before using the class, it must be opened using the [open] method
class UserStore extends CityChoiceUserStore {
  late final SharedPreferences _sharedPrefs;

  Customer? _customer;
  String? _selectedCityId;

  Customer? get customer => _customer;

  String? get selectedCityId => _selectedCityId;

  Future<void> open() async {
    _sharedPrefs = await SharedPreferences.getInstance();

    _customer = _sharedPrefs.getString(customerKey) != null
        ? Customer.fromJson(jsonDecode(_sharedPrefs.getString(customerKey)!))
        : null;
    _selectedCityId = _sharedPrefs.getString(selectedCityKey);
  }

  Future<void> setCustomer(final Customer? customer) async {
    await _setPrefsValue(
      customerKey,
      customer == null ? null : jsonEncode(customer),
    );
    _customer = customer;
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
