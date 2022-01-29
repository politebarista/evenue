import 'dart:convert';

import 'package:evenue/common/config.dart';
import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/common/password_helper.dart';
import 'package:evenue/common/status_code.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const userIdKey = 'userId';

class UserRepository {
  final AppDefinition _appDef = Config.appDef;

  Future<bool> login(String email, String password) async {
    final loginUserUrl = 'loginUser';

    final response = await http.post(
      Uri.parse(_appDef.baseUrl + loginUserUrl),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': PasswordHelper.hash(password),
      }),
    );

    final body = jsonDecode(response.body);
    print(body);
    print(body is int);
    if (body != StatusCode.userDontExist &&
        body != StatusCode.incorrectPassword) {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(userIdKey, body);
    } else {
      // TODO maybe I need to put here logging
      return false;
    }
  }
}
