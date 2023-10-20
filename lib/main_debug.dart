import 'dart:io';

import 'package:evenue/common/config.dart';
import 'package:evenue/common/flavor.dart';
import 'package:evenue/common/debug_http_override.dart';
import 'package:evenue/evenue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = DebugHttpOverride();

  runApp(
    Provider<Config>(
      create: (_) => Config(Flavor.debug),
      child: const Evenue(),
    ),
  );
}
