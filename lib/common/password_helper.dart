import 'dart:convert';

import 'package:crypto/crypto.dart';

class PasswordHelper {
  static String hash(final String text) =>
      sha256.convert(utf8.encode(text)).toString();

  static bool isPasswordValid(final String? password) {
    final passwordMinLength = 5;

    return !(password == null ||
        password.trim().isEmpty ||
        password.trim().length < passwordMinLength);
  }
}
