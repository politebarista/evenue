import 'package:evenue/repositories/cities_repository/cities_repository.dart';
import 'package:evenue/repositories/customer_repository.dart';
import 'package:evenue/repositories/organizer_repository.dart';

class RepositoriesStore {
  final CustomerRepository customerRepository;
  final OrganizerRepository organizerRepository;
  final CitiesRepository citiesRepository;

  RepositoriesStore(
    this.customerRepository,
    this.organizerRepository,
    this.citiesRepository,
  );
}
