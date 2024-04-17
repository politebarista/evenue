import 'dart:async';

import 'package:evenue/common/config.dart';
import 'package:evenue/common/flavor.dart';
import 'package:evenue/evenue.dart';
import 'package:evenue/repositories/cities_repository/cities_repository.dart';
import 'package:evenue/repositories/cities_repository/mock_cities_repository.dart';
import 'package:evenue/repositories/cities_repository/server_cities_repository.dart';
import 'package:evenue/repositories/customer_repository.dart';
import 'package:evenue/repositories/organizer_repository.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void runner(Config config) async {
  runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

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
        CustomerRepository(userStore, config.appDef),
        OrganizerRepository(userStore, config.appDef),
        citiesRepository,
      );

      runApp(
        MultiProvider(
          providers: [
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
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}