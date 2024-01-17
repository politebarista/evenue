import 'dart:async';

import 'package:evenue/common/config.dart';
import 'package:evenue/common/ui/custom_text_theme.dart';
import 'package:evenue/common/ui/custom_theme.dart';
import 'package:evenue/features/init/init_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void runner(Config config) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runZonedGuarded(
    () => runApp(Evenue(config)),
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}

class Evenue extends StatelessWidget {
  final Config config;

  const Evenue(this.config, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTextTheme = CustomTextTheme(context);
    final customTheme = CustomTheme(customTextTheme);

    return Provider<Config>(
      create: (_) => config,
      child: MaterialApp(
        theme: customTheme.themeData,
        home: InitScreen(),
      ),
    );
  }
}
