import 'package:evenue/features/city_choice/city_choice_user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userIdKey = 'userId';
const selectedCityKey = 'selectedCity';

/// Before using the class, it must be opened using the [open] method
class UserStore extends CityChoiceUserStore {
  late final SharedPreferences _sharedPrefs;

  String? _userId;
  String? _selectedCityId;

  String? get userId => _userId;
  String? get selectedCityId => _selectedCityId;

  Future<void> open() async {
    _sharedPrefs = await SharedPreferences.getInstance();

    _userId = _sharedPrefs.getString(userIdKey);
    _selectedCityId = _sharedPrefs.getString(selectedCityKey);
  }

  Future<void> setUserId(final String? userId) async {
    _setPrefsValue(userIdKey, userId);
    _userId = userId;
  }

  Future<void> setSelectedCityId(final String? selectedCityId) async {
    _setPrefsValue(selectedCityKey, selectedCityId);
    _selectedCityId = selectedCityId;
  }

  void _setPrefsValue(final String valueKey, final String? value) {
    if (value == null) {
      // ignore: avoid-ignoring-return-values
      _sharedPrefs.remove(valueKey);
    } else {
      // ignore: avoid-ignoring-return-values
      _sharedPrefs.setString(valueKey, value);
    }
  }
}
