import 'dart:convert';

import 'package:evenue/common/config.dart';
import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/common/password_helper.dart';
import 'package:evenue/common/status_code.dart';
import 'package:evenue/models/customer.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrganizerRepository {
  final UserStore _userStore;
  final AppDefinition _appDef = Config.appDef;

  bool get isCustomerAuthorized => _userStore.customer != null;

  OrganizerRepository(this._userStore);

  Future<bool> login(String email, String password) async {
    print('need to implement login feature for organizer');
  }

  Future<void> logout() async => print(
        'need to implement logout feature for organizer',
      );
}
