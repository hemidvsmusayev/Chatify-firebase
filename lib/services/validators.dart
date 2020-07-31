class Validator {
  String validateName(String val) {
    return val.isEmpty || val.length < 4 ? "Enter correct name" : null;
  }

  String validateEmail(String val) {
    return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(val)
        ? null
        : "Enter correct email";
  }

  String validatePassword(String val) {
    return val.length > 6 ? null : "Password must be 6+ character ";
  }
}
