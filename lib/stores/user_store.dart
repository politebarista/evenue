import 'dart:convert';

import 'package:evenue/features/city_choice/city_choice_user_store.dart';
import 'package:evenue/models/customer.dart';
import 'package:evenue/models/organizer.dart';
import 'package:evenue/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: make keys private
const customerKey = 'customer';
const organizerKey = 'organizer';
const selectedCityKey = 'selectedCity';

/// TODO: close constructor and use [open] converted to factory method
/// Before using the class, it must be opened using the [open] method
class UserStore extends CityChoiceUserStore {
  late final SharedPreferences _sharedPrefs;

  String? _selectedCityId;
  Customer? _customer;
  Organizer? _organizer;

  String? get selectedCityId => _selectedCityId;
  User? get user => _customer ?? _organizer;

  bool get isUserAuthorized => user != null;

  Future<void> open() async {
    _sharedPrefs = await SharedPreferences.getInstance();

    _selectedCityId = _sharedPrefs.getString(selectedCityKey);
    _customer = _sharedPrefs.getString(customerKey) != null
        ? Customer.fromJson(jsonDecode(_sharedPrefs.getString(customerKey)!))
        : null;
    _organizer = _sharedPrefs.getString(organizerKey) != null
        ? Organizer.fromJson(jsonDecode(_sharedPrefs.getString(organizerKey)!))
        : null;
  }

  Future<void> setSelectedCityId(final String? selectedCityId) async {
    await _setPrefsValue(selectedCityKey, selectedCityId);
    _selectedCityId = selectedCityId;
  }

  Future<void> setCustomer(final Customer? customer) async {
    await _setPrefsValue(
      customerKey,
      customer == null ? null : jsonEncode(customer.toJson()),
    );
    _customer = customer;
  }

  Future<void> setOrganizer(final Organizer? organizer) async {
    await _setPrefsValue(
      organizerKey,
      organizer == null ? null : jsonEncode(organizer.toJson()),
    );
    _organizer = organizer;
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
