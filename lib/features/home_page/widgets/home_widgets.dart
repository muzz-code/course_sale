
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/core/constants/colors.dart';
import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_shadow.dart';
import '../../../common/widgets/image_widgets.dart';
import '../../../common/widgets/text_widgets.dart';
import '../../../global/global.dart';
import '../../auth/sign_in/entities/user.dart';

AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(width: 58.w, height: 52.h, imagePath: ImageRes.orangeBackgroundIcon),
          appImage(width: 58.w, height: 52.h, imagePath: ImageRes.logo),
        ],
      ),
    ),
  );
}

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProfile? userProfile = Global.storageService.getUserProfile();
    return Container(
      child: userProfile != null
          ? text14Normal(
        text: "Hello, ${userProfile.name}" ?? "No name provided",
      )
          : const Text("User not found"),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
          text: "Hello, ",
          color: AppColors.primaryElement,
          fontWeight: FontWeight.bold),
    );
  }
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //see all course
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: "Delicious Food for you",
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text10Normal(
                  text: "See all",
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        //course item button
        Row(
          children: [
            Container(
              decoration:
              appBoxShadow(color: AppColors.primaryElement, radius: 7.w),
              padding: EdgeInsets.only(
                  left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
              child: const Text11Normal(
                text: "All",
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child:  const Text11Normal(
                text: "Popular",
                color: AppColors.primaryElement,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: const Text11Normal(
                text: "Newest",
                color: AppColors.primaryElement,
              ),
            )
          ],
        )
      ],
    );
  }
}