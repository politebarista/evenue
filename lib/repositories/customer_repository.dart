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
  final AppDefinition _appDef = Config.appDef;

  /// TODO I think it should be a
  /// parameter passed to the repository

  CustomerRepository(this._userStore);

  /// TODO: Maybe I should return status code cause user need to know whats
  /// error is appear
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
    }

    final customer = Customer.fromJson(body);
    await _userStore.setCustomer(customer);
    return true;
  }

  Future<void> logout() async => await _userStore.setCustomer(null);

  Future<bool> register(
    String lastName,
    String firstName,
    String email,
    String phoneNumber,
    String password,
  ) async {
    final registerCustomerUrl = 'registerCustomer';

    final response = await http.post(
      Uri.parse(_appDef.baseUrl + registerCustomerUrl),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(<String, String>{
        'lastName': lastName,
        'firstName': firstName,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': PasswordHelper.hash(password),
      }),
    );

    final body = jsonDecode(response.body);

    if (body == EvenueStatusCode.customerAlreadyExist ||
        body == EvenueStatusCode.errorWhileCreatingCustomer) {
      return false;
    }

    final customer = Customer.fromJson(body);
    await _userStore.setCustomer(customer);
    return true;
  }
}
