import 'dart:io';

import 'package:evenue/common/config.dart';
import 'package:evenue/common/flavor.dart';
import 'package:evenue/common/debug_http_override.dart';
import 'package:evenue/evenue.dart';
import 'package:flutter/material.dart';

void main() {
  Config.flavor = Flavor.debug;

  HttpOverrides.global = DebugHttpOverride();

  runApp(const Evenue());
}
