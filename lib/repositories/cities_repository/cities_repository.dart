import 'package:evenue/models/city.dart';

abstract interface class CitiesRepository {
  Future<List<City>> getCities();
}