import 'package:bloc/bloc.dart';
import 'package:evenue/common/config.dart';
import 'package:evenue/common/flavor.dart';
import 'package:evenue/repositories/cities_repository/cities_repository.dart';
import 'package:evenue/repositories/cities_repository/mock_cities_repository.dart';
import 'package:evenue/repositories/cities_repository/server_cities_repository.dart';
import 'package:evenue/repositories/customer_repository.dart';
import 'package:evenue/repositories/organizer_repository.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:meta/meta.dart';

part 'init_event.dart';

part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final Config _config;

  InitBloc(
    Config config,
  )   : _config = config,
        super(InitNotReadyState()) {
    on<InitEvent>(_init);
  }

  _init(InitEvent _, Emitter<InitState> emit) async {
    final userStore = UserStore();
    await userStore.open();

    late final CitiesRepository citiesRepository;
    switch (_config.flavor) {
      case Flavor.debug:
        citiesRepository = MockCitiesRepository();
        break;
      case Flavor.production:
        citiesRepository = ServerCitiesRepository(_config.appDef);
        break;
    }

    final repositoriesStore = RepositoriesStore(
      CustomerRepository(userStore, _config.appDef),
      OrganizerRepository(userStore, _config.appDef),
      citiesRepository,
    );

    emit(InitReadyState(userStore, repositoriesStore));
  }
}
