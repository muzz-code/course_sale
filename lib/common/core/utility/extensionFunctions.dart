extension EmailValidation on String {
  bool isValidEmail() {
    RegExp emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return emailRegex.hasMatch(this);
  }
}

// TODO: observe this backslash it could be buggy
extension PhoneNumberValidation on String {
  bool isValidPhoneNumber() {
    RegExp phoneRegex = RegExp(r'^\+?[0-9()-|\s]+$');
    return phoneRegex.hasMatch(this);
  }
}