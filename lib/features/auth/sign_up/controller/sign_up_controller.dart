import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/extensionFunctions.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import '../../util/util_functions.dart';
import '../provider/register_notifier.dart';
import '../repo/sign_up_repo.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({required this.ref});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isEmailFieldValid = true;
  bool isNameValid = true;
  bool isPasswordValid = true;
  bool isValidInputs = false;

  validateFields(
      {String? emailValue,
        String? phoneNumber,
        String? name,
        String? password}) {
    var state = ref.read(registerNotifierProvider);
    emailValue = state.email;
    name = state.userName;
    password = state.password;
    emailController.text = emailValue;
    nameController.text = name;
    passwordController.text = password;
    bool isEmailValid = emailValue.isValidEmail();
    bool isNameInputValid = name.isValidName();
    bool isPasswordInputValid = password.isValidPassword();
    if (name.isNotEmpty) {
      if (isNameInputValid == true) {
        isNameValid = true;
      } else {
        isNameValid = false;
      }
    }
    if (password.isNotEmpty) {
      if (isPasswordInputValid == true) {
        isPasswordValid = true;
      } else {
        isPasswordValid = false;
      }
    }

    if (emailValue.isNotEmpty) {
      if (isEmailValid == true) {
        isEmailFieldValid = true;
      } else {
        isEmailFieldValid = false;
      }
    }
    if (isNameValid == true &&
        isPasswordValid == true &&
        isEmailFieldValid == true) {
      isValidInputs = true;
    }
  }

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    nameController.text = name;
    emailController.text = email;
    passwordController.text = password;

    checkInput(state.userName, name, state.email, password, state.rePassword);
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);
    try {
      final credential = await SignUpRep.firebaseSignUp(email, password);

      if (kDebugMode) {
        print(credential);
      }
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        toastInfo(
          "An email has been sent to verify your account. Please open that email and confirm your identity.",
        );
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        toastInfo(
          "Account already exists",
        );
      } else {
        toastInfo(
          "An error occurred during signup.",
        );
      }
      _resetState();
      if (kDebugMode) {
        print(e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      toastInfo(
        "An error occurred.",
      );
      _resetState();
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void _resetState() {
    // Reset the TextEditingControllers
    nameController.clear();
    emailController.clear();
    passwordController.clear();

    // Reset the notifier state
    ref.read(registerNotifierProvider.notifier).resetState();

    // Reset the validation flags
    isEmailFieldValid = true;
    isNameValid = true;
    isPasswordValid = true;
    isValidInputs = false;
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}