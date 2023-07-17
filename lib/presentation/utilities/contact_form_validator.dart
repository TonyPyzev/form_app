class ContactFormValidator {
  static bool isValidName(String value) {
    return value.trim().isNotEmpty;
  }

  static bool isValidEmail(String value) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(value.trim());
  }

  static bool isValidMessgae(String value) {
    return value.trim().isNotEmpty;
  }
}
