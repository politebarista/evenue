import 'dart:convert';

import 'package:evenue/common/config.dart';
import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/common/password_helper.dart';
import 'package:evenue/common/status_code.dart';
import 'package:evenue/models/customer.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerRepository {
  final UserStore _userStore;
  final AppDefinition _appDef = Config.appDef;

  bool get isCustomerAuthorized => _userStore.customer != null;

  CustomerRepository(this._userStore);

  Future<bool> login(String email, String password) async {
    final loginUserUrl = 'loginUser';

    final response = await http.post(
      Uri.parse(_appDef.baseUrl + loginUserUrl),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(<String, String>{
        'email': email,
        'password': PasswordHelper.hash(password),
      }),
    );

    final body = jsonDecode(response.body);

    if (body == StatusCode.customerDontExist ||
        body == StatusCode.incorrectPassword) {
      // TODO maybe I need to put here logging
      return false;
    } else {
      final user = Customer.fromJson(body);
      _userStore.setCustomer(user);
      return true;
    }
  }

  Future<void> logout() => _userStore.setCustomer(null);
}
