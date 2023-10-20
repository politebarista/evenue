import 'dart:convert';

import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/models/city.dart';
import 'package:http/http.dart' as http;

import 'cities_repository.dart';

class ServerCitiesRepository implements CitiesRepository {
  final AppDefinition _appDef;

  ServerCitiesRepository(this._appDef);

  Future<List<City>> getCities() async {
    final getCities = 'getCities';

    final response = await http.get(
      Uri.parse(_appDef.baseUrl + getCities),
    );
    final body = jsonDecode(response.body);
    final cities = <City>[];
    for (Map<String, dynamic> city in body) {
      cities.add(City.fromJson(city));
    }

    return cities;
  }
}