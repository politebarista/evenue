import 'dart:convert';

import 'package:crypto/crypto.dart';

class PasswordHelper {
  static String hash(final String text) =>
      sha256.convert(utf8.encode(text)).toString();
}
