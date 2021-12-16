import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/common/definition/debug_app_definition.dart';
import 'package:evenue/common/flavor.dart';

class Config {
  static late final Flavor flavor;

  static AppDefinition? _currentAppDef;

  static AppDefinition get appDef {
    late final currentAppDef;

    if (_currentAppDef == null) {
      switch (flavor) {
        case Flavor.debug:
          currentAppDef = DebugAppDefinition();
          break;
        case Flavor.production:
          currentAppDef = DebugAppDefinition(); // TODO CHANGE THIS TO PROD
          break;
      }
      _currentAppDef = currentAppDef;
    } else {
      currentAppDef = _currentAppDef;
    }

    return currentAppDef;
  }
}
