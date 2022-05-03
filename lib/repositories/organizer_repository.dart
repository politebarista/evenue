import 'dart:convert';

import 'package:evenue/common/config.dart';
import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/common/password_helper.dart';
import 'package:evenue/common/evenue_status_code.dart';
import 'package:evenue/models/customer.dart';
import 'package:evenue/models/organizer.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrganizerRepository {
  final UserStore _userStore;
  final AppDefinition _appDef = Config.appDef; /// TODO I think it should be a
  /// parameter passed to the repository

  OrganizerRepository(this._userStore);

  Future<bool> login(String contactPersonEmail, String password) async {
    final loginOrganizerUrl = 'loginOrganizer';

    final response = await http.post(
      Uri.parse(_appDef.baseUrl + loginOrganizerUrl),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(<String, String>{
        'contactPersonEmail': contactPersonEmail,
        'password': PasswordHelper.hash(password),
      }),
    );

    final body = jsonDecode(response.body);

    if (body == EvenueStatusCode.organizerDontExist ||
        body == EvenueStatusCode.incorrectPassword) {
      // TODO maybe I need to put here logging
      return false;
    } else {
      final organizer = Organizer.fromJson(body);
      await _userStore.setOrganizer(organizer);
      return true;
    }
  }

  Future<void> logout() async => await _userStore.setOrganizer(null);
}
