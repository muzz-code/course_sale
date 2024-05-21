import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/login_controller.dart';
import 'package:ulearning_app/pages/sign_in/notifier/login_notifier.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(loginNotifierProvider);
    final signInNotifier = ref.read(loginNotifierProvider.notifier);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppbar(title: "Login"),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //top login buttons
                  thirdPartyLogin(),
                  //more login options message
                  Center(
                      child: text14Normal(
                          text: "Or use your email account to login")),
                  SizedBox(
                    height: 50.h,
                  ),
                  //email text box
                  appTextField(
                    controller: _controller.emailController,
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your email address",
                    func: (value) {
                      signInNotifier.onEmailChange(value);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //password text box
                  appTextField(
                    text: "Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Enter your password",
                    obscureText: true,
                    func: (value) {
                      signInNotifier.onPasswordChange(value);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //forgot text
                  Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: textUnderline(text: "Forgot password?")),
                  SizedBox(
                    height: 100.h,
                  ),
                  //app login button
                  Center(
                      child: appButton(
                          buttonName: "Login",
                          func: () => _controller.handleLogin)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: appButton(
                          buttonName: "Register",
                          isLogin: false,
                          context: context,
                          func: () =>
                              Navigator.pushNamed(context, "/register")))
                  //app register button
                ],
              ),
            )),
      ),
    );
  }
}
