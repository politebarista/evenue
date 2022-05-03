import 'dart:convert';

import 'package:evenue/common/config.dart';
import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/common/password_helper.dart';
import 'package:evenue/common/evenue_status_code.dart';
import 'package:evenue/models/customer.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerRepository {
  final UserStore _userStore;
  final AppDefinition _appDef = Config.appDef; /// TODO I think it should be a
  /// parameter passed to the repository

  CustomerRepository(this._userStore);

  Future<bool> login(String email, String password) async {
    final loginCustomerUrl = 'loginCustomer';

    final response = await http.post(
      Uri.parse(_appDef.baseUrl + loginCustomerUrl),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(<String, String>{
        'email': email,
        'password': PasswordHelper.hash(password),
      }),
    );

    final body = jsonDecode(response.body);

    if (body == EvenueStatusCode.customerDontExist ||
        body == EvenueStatusCode.incorrectPassword) {
      // TODO maybe I need to put here logging
      return false;
    } else {
      final user = Customer.fromJson(body);
      await _userStore.setCustomer(user);
      return true;
    }
  }

  Future<void> logout() async => await _userStore.setCustomer(null);
}
