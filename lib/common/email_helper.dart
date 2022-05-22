class EmailHelper {
  static bool isEmailValid(final String? email) {
    if (email == null || email.trim().isEmpty) return false;

    final RegExp emailVerifier = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    return emailVerifier.hasMatch(email);
  }
}
