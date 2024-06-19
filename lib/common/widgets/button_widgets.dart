import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appButton(
    {double width = 325,
    double height = 70,
    String buttonName = "",
    bool isLogin = true,
    Color backgroundColor = Colors.white,
    BuildContext? context,
    Color? textColor,
    void Function()? func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width.w,
      height: height.h,
      //isLogin true then send primary color else send white color
      decoration: appBoxShadow(
          radius: 40,
          color: isLogin ? AppColors.primaryElement : backgroundColor,
          border: Border.all(color: AppColors.primaryFourthElementText)),
      child: Center(
          child: text16Normal(
              text: buttonName,
              color: textColor ?? AppColors.backgroundOrange)),
    ),
  );
}
