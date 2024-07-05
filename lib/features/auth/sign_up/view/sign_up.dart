import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import '../../../../common/utils/image_res.dart';
import '../../../../common/widgets/app_textfields.dart';
import '../controller/sign_up_controller.dart'; // Correct import
import '../provider/register_notifier.dart';

class SignUp extends ConsumerStatefulWidget {
  static const routeName = '/SignUp';

  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    ref.read(registerNotifierProvider.notifier).resetState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              ImageRes.logo,
                              fit: BoxFit.fitWidth,
                            ),
                            text24Normal(
                              text: "Create an account",
                              color: AppColors.textHeaderColors,
                            ),
                            text14Normal(text: "Join us now today"),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                      appTextField(
                          inputValidity: _controller.isNameValid,
                          text: "Name",
                          iconName: "assets/icons/user.png",
                          hintText: "Enter your user name",
                          func: (value) {
                            ref
                                .read(registerNotifierProvider.notifier)
                                .onUserNameChange(value);
                            if (value.isNotEmpty) {
                              _controller.validateFields(name: value);
                            }
                          }),
                      SizedBox(height: 20.h),
                      appTextField(
                        inputValidity: _controller.isEmailFieldValid,
                        text: "Email",
                        iconName: "assets/icons/user.png",
                        hintText: "Enter your email address",
                        func: (value) {
                          ref
                              .read(registerNotifierProvider.notifier)
                              .onUserEmailChange(value);
                          if (value.isNotEmpty) {
                            _controller.validateFields(emailValue: value);
                          }
                        },
                      ),
                      SizedBox(height: 20.h),
                      appTextField(
                          inputValidity: _controller.isPasswordValid,
                          text: "Password",
                          iconName: "assets/icons/lock.png",
                          hintText: "Enter your password",
                          obscureText: true,
                          func: (value) {
                            ref
                                .read(registerNotifierProvider.notifier)
                                .onUserPasswordChange(value);
                            _controller.validateFields(password: value);
                          }),
                      SizedBox(height: 20.h),
                      Container(
                        margin: EdgeInsets.only(left: 25.w),
                        child: text14Normal(
                          text: "Must be at least 8 characters",
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Column(
                        children: [
                          Center(
                            child: appButton(
                              height: 54,
                              buttonName: "Get Started",
                              backgroundColor: AppColors.backgroundOrange,
                              isLogin: false,
                              context: context,
                              textColor: Colors.white,
                              func: _controller.isValidInputs
                                  ? () => _controller.handleSignUp()
                                  : () {
                                      toastInfo("invalid inputs");
                                    },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: appButton(
                              height: 54,
                              buttonName: "Sign up with Google",
                              isLogin: false,
                              context: context,
                              textColor: AppColors.buttonTextColor,
                              func: () => _controller.handleSignUp(),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                text14Normal(
                                  text: "Already have an account",
                                ),
                                SizedBox(width: 5.w),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, '/SignIn');
                                  },
                                  child: text14Normal(
                                    text: "Log in",
                                    color: AppColors.backgroundOrange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5.w),
                        ],
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
