import 'dart:convert';

import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/common/password_helper.dart';
import 'package:evenue/common/evenue_status_code.dart';
import 'package:evenue/models/organizer.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:http/http.dart' as http;

class OrganizerRepository {
  final UserStore _userStore;
  final AppDefinition _appDef;

  OrganizerRepository(this._userStore, this._appDef);

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
      return false;
    } else {
      final organizer = Organizer.fromJson(body);
      await _userStore.setOrganizer(organizer);
      return true;
    }
  }

  Future<void> logout() async => await _userStore.setOrganizer(null);
}
