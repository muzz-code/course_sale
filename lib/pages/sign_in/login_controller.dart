import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/global/global.dart';
import 'package:ulearning_app/pages/sign_in/entities/entities.dart';
import 'package:ulearning_app/pages/sign_in/notifier/login_notifier.dart';

import '../../common/widgets/popup_messages.dart';

class LoginController {
  WidgetRef ref;

  LoginController({required this.ref});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    var state = ref.read(loginNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    print('email $email password $password');
    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if ((state.password.isEmpty) || password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credentials.user == null) {
        toastInfo('user not found');
      }
      if (!credentials.user!.emailVerified) {
        toastInfo('you must verify your email address first');
      }
      var user = credentials.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? userAvatar = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.email = email;
        loginRequestEntity.name = displayName;
        loginRequestEntity.open_id = id;
        loginRequestEntity.avatar = userAvatar;
        asyncPostAllData(loginRequestEntity);
        print('user logged in');
      } else {
        toastInfo('login error');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo('user not found');
      } else if (e.code == 'wrong-password') {
        toastInfo('your password is wrong');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    try {
      var navigator = Navigator.of(ref.context);
      Global.storageService.setString(
          AppConstants.STORAGE_USER_PROFILE_KEY, '123');
      Global.storageService.setString(
          AppConstants.STORAGE_USER_TOKEN_KEY, '123456');
      navigator.push(MaterialPageRoute(builder: (BuildContext context) =>
          Scaffold(appBar: AppBar(), body: Container(),)));

    } catch (e) {
      print('an error occurred');
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
