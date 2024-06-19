import '../../../common/widgets/popup_messages.dart';

enum ValidationState {
  nameEmpty,
  nameTooShort,
  emailEmpty,
  passwordEmpty,
  valid
}

ValidationState validateInput(String userName, String name, String email, String password, String rePassword) {
  if (userName.isEmpty || name.isEmpty) {
    return ValidationState.nameEmpty;
  }
  if (userName.length < 6 || name.length < 6) {
    return ValidationState.nameTooShort;
  }
  if (email.isEmpty) {
    return ValidationState.emailEmpty;
  }
  if (password.isEmpty) {
    return ValidationState.passwordEmpty;
  }
  return ValidationState.valid;
}

void handleValidation(ValidationState state) {
  switch (state) {
    case ValidationState.nameEmpty:
      toastInfo("Your name is empty");
      break;
    case ValidationState.nameTooShort:
      toastInfo("Your name is too short");
      break;
    case ValidationState.emailEmpty:
      toastInfo("Your email is empty");
      break;
    case ValidationState.passwordEmpty:
      toastInfo("Your signup password is empty");
      break;
    case ValidationState.valid:
      break;
  }
}

void checkInput(String userName, String name, String email, String password, String rePassword) {
  ValidationState state = validateInput(userName, name, email, password, rePassword);
  handleValidation(state);
}

