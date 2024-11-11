class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(password);
  }

  static bool isPasswordValidStrong(String password) {
    return RegExp(r"^(?=.*[a-z])(?=.*\d)[a-z\d]{6,}$").hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  // static bool isPhoneNumberValid(String phoneNumber) {
  //   return RegExp(
  //           r'^\+?[0-9]{1,3}?[-. ]?\(?[0-9]{1,3}\)?[-. ]?[0-9]{1,4}[-. ]?[0-9]{1,4}$')
  //       .hasMatch(phoneNumber);
  // }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^1\d{9}$').hasMatch(phoneNumber);
  }

  static bool isAddressValid(String address) {
    return RegExp(r'^\d+\s[A-z]+\s[A-z]+,\s[A-z]+\s[A-z]{2}\s\d{5}$')
        .hasMatch(address);
  }

  static bool isTextOnly(String input) {
    return RegExp(r'^[a-zA-Z_\u0600-\u06FF]+ ?$').hasMatch(input);
  }
}
