import 'package:evenue/common/config.dart';
import 'package:evenue/common/flavor.dart';
import 'package:evenue/evenue.dart';
import 'package:flutter/material.dart';

void main() {
  Config.flavor = Flavor.production;

  runApp(const Evenue());
}
