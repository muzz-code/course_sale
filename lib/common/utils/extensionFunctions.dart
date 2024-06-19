extension EmailValidation on String {
  bool isValidEmail() {
    RegExp emailRegex = RegExp(
      r'^[^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*@'
      r'((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|'
      r'(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    return emailRegex.hasMatch(this);
  }
}
extension NameValidation on String {
  bool isValidName() {
    if (isEmpty || length < 3) return false;
    RegExp nameRegex = RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
    return nameRegex.hasMatch(this);
  }
}

extension PasswordValidation on String {
  bool isValidPassword() {
    RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    return passwordRegex.hasMatch(this);
  }
}
// TODO: observe this backslash it could be buggy
extension PhoneNumberValidation on String {
  bool isValidPhoneNumber() {
    RegExp phoneRegex = RegExp(r'^\+?[0-9()-|\s]+$');
    return phoneRegex.hasMatch(this);
  }
}
