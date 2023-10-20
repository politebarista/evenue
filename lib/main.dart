import 'package:evenue/common/config.dart';
import 'package:evenue/common/flavor.dart';
import 'package:evenue/evenue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider<Config>(
      create: (_) => Config(Flavor.production),
      child: const Evenue(),
    ),
  );
}
