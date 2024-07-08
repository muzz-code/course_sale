import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

Widget text24Normal(
    {String text = "",
      Color color = AppColors.primaryText,
      FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: 24.sp, fontWeight: fontWeight),
  );
}


Widget text50Bold({
  String text = "",
  Color color = AppColors.primaryText,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 55.sp,
      fontFamily: 'GothamBold',
      fontWeight: FontWeight.bold,
      height: 1.0, // Ensures no extra space between lines
    ),
  );
}

Widget text16Normal({
  String text = "",
  Color color = AppColors.primarySecondaryElementText,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'GothamMedium',
    ),
  );
}

Widget text14Normal(
    {String text = "", Color color = AppColors.primaryThirdElementText}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontFamily: 'GothamRounded-Medium'),
  );
}

Widget textUnderline({String text = "Your text"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12.sp,
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
      ),
    ),
  );
}


class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const Text16Normal(
      {Key? key,
        this.text = "",
        this.color = AppColors.primarySecondaryElementText,
        this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 16.sp, fontWeight: fontWeight),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text14Normal(
      {Key? key,
        this.text = "",
        this.color = AppColors.primaryThirdElementText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: color, fontSize: 14.sp, fontWeight: FontWeight.normal),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text11Normal(
      {Key? key,
        this.text = "",
        this.color = AppColors.primaryElementText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: color, fontSize: 11.sp, fontWeight: FontWeight.normal),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text10Normal(
      {Key? key,
        this.text = "",
        this.color = AppColors.primaryThirdElementText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: color, fontSize: 10.sp, fontWeight: FontWeight.normal),
    );
  }
}


