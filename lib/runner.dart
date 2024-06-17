import 'dart:async';

import 'package:evenue/common/config.dart';
import 'package:evenue/common/flavor.dart';
import 'package:evenue/error_logger/error_logger.dart';
import 'package:evenue/error_logger/firebase_error_logger.dart';
import 'package:evenue/evenue.dart';
import 'package:evenue/repositories/cities_repository/cities_repository.dart';
import 'package:evenue/repositories/cities_repository/mock_cities_repository.dart';
import 'package:evenue/repositories/cities_repository/server_cities_repository.dart';
import 'package:evenue/repositories/customer_repository.dart';
import 'package:evenue/repositories/events_repository/server_events_repository.dart';
import 'package:evenue/repositories/organizer_repository.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void runner(Config config) async {
  final ErrorLogger errorLogger = FirebaseErrorLogger();

  runZonedGuarded(
    () async {
      // ignore: unused_local_variable
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      // ignore: avoid-ignoring-return-values
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final userStore = UserStore();
      await userStore.open();

      late final CitiesRepository citiesRepository;
      switch (config.flavor) {
        case Flavor.debug:
          citiesRepository = MockCitiesRepository();
          break;
        case Flavor.production:
          citiesRepository = ServerCitiesRepository(config.appDef);
          break;
      }

      final repositoriesStore = RepositoriesStore(
        customerRepository: CustomerRepository(userStore, config.appDef),
        organizerRepository: OrganizerRepository(userStore, config.appDef),
        citiesRepository: citiesRepository,
        eventsRepository:  ServerEventsRepository(config.appDef),
      );

      runApp(
        MultiProvider(
          providers: [
            Provider<ErrorLogger>(create: (_) => errorLogger),
            Provider<Config>(create: (_) => config),
            Provider<UserStore>(create: (_) => userStore),
            Provider<RepositoriesStore>(
              create: (_) => repositoriesStore,
            ),
          ],
          child: Evenue(),
        ),
      );
    },
    (error, stack) => errorLogger.sendError(error, stack),
  );
}
