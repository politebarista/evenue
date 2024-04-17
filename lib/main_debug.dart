import 'dart:io';

import 'package:evenue/common/config.dart';
import 'package:evenue/common/flavor.dart';
import 'package:evenue/common/debug_http_override.dart';
import 'package:evenue/runner.dart';

void main() {
  HttpOverrides.global = DebugHttpOverride();

  runner(Config(Flavor.debug));
}
