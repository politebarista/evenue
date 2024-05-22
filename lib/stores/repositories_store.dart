import 'package:evenue/repositories/cities_repository/cities_repository.dart';
import 'package:evenue/repositories/customer_repository.dart';
import 'package:evenue/repositories/events_repository/events_repository.dart';
import 'package:evenue/repositories/organizer_repository.dart';

final class RepositoriesStore {
  final CustomerRepository customerRepository;
  final OrganizerRepository organizerRepository;
  final CitiesRepository citiesRepository;
  final EventsRepository eventsRepository;

  const RepositoriesStore({
    required this.customerRepository,
    required this.organizerRepository,
    required this.citiesRepository,
    required this.eventsRepository,
  });
}
