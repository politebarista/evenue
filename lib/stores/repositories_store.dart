import 'package:evenue/repositories/cities_repository.dart';
import 'package:evenue/repositories/customer_repository.dart';

class RepositoriesStore {
  final CustomerRepository customerRepository;
  final CitiesRepository citiesRepository;

  RepositoriesStore(this.customerRepository, this.citiesRepository);
}