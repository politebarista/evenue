import 'package:evenue/models/city.dart';

import 'cities_repository.dart';

class MockCitiesRepository implements CitiesRepository {
  Future<List<City>> getCities() async {
    // ignore: avoid-ignoring-return-values
    await Future.delayed(const Duration(seconds: 3));
    return [
      City('20f9e059-cdb4-44bd-8a83-b348cc7b1bbf', 'Новокузнецк'),
      City('aa6a0949-45e7-4d37-b35d-46c796d99232', 'Кемерово'),
    ];
  }
}