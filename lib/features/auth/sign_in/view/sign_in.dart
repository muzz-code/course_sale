import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import '../../../../common/widgets/app_bar.dart';
import '../../../../common/widgets/app_textfields.dart';
import '../../../../common/widgets/popup_messages.dart';
import '../controller/login_controller.dart';
import '../provider/login_notifier.dart';
import '../widgets/sign_in_widgets.dart';

class SignIn extends ConsumerStatefulWidget {
  static const routeName = '/SignIn';

  const SignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late LoginController _controller;

  @override
  void initState() {
    _controller = LoginController(ref: ref);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    ref.read(loginNotifierProvider.notifier).resetState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(loginNotifierProvider);
    final signInNotifier = ref.read(loginNotifierProvider.notifier);
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: loader == false
            ? Scaffold(
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
                            height: 54,
                            buttonName: "Sign In",
                            backgroundColor: AppColors.backgroundOrange,
                            isLogin: false,
                            context: context,
                            textColor: Colors.white,
                            func: () => _controller.login()),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: appButton(
                          height: 54,
                          buttonName: "Sign In with google",
                          isLogin: false,
                          context: context,
                          textColor: AppColors.buttonTextColor,
                          func: () => toastInfo("sign in with google"),
                        ),
                      ),
                      //app register button
                    ],
                  ),
                ))
            : const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  color: AppColors.primaryElement,
                ),
              ),
      ),
    );
  }
}
