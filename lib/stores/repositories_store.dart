import 'package:evenue/repositories/cities_repository.dart';
import 'package:evenue/repositories/user_repository.dart';

class RepositoriesStore {
  final UserRepository userRepository;
  final CitiesRepository citiesRepository;

  RepositoriesStore(this.userRepository, this.citiesRepository);
}