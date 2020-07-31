String validateName(String text) {
  return text.isEmpty || text.length < 3
      ? "Enter Username 3+ characters"
      : null;
}

String validateEmail(String text) {
  return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(text)
      ? null
      : "Please Enter Correct Email";
}

String validatePassword(String text) {
  return text.length > 6 ? null : "Enter Password 6+ characters";
}
