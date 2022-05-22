class PhoneNumberHelper {
  static bool isPhoneNumberValid(final String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) return false;

    final RegExp phoneNumberVerifier = RegExp(
      r"^[0-9\-\+]{9,15}$",
    );

    return phoneNumberVerifier.hasMatch(phoneNumber);
  }
}
