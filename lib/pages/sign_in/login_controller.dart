import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/sign_in/notifier/login_notifier.dart';

import '../../common/widgets/popup_messages.dart';

class LoginController {
  WidgetRef ref;

  LoginController({required this.ref});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleLogin() async {
    var state = ref.read(loginNotifierProvider);
    String email = state.email;
    String password = state.password;
    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if ((state.password.isEmpty) || password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }
    try{
      final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if(credentials.user == null){
        toastInfo('user not found');
      }
      if(!credentials.user!.emailVerified){
        toastInfo('you must verify your email address first');
      }
      var user = credentials.user;
      if(user != null){
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? userAvatar = user.photoURL;
      }
    } catch(e){}
  }
}
