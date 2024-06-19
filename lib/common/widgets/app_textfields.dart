import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import 'app_shadow.dart';
import 'image_widgets.dart';

Widget appTextField(
    {String text = "",
      String iconName = "",
      String hintText = "Type in your info",
      bool obscureText = false,
      void Function(String value)? func,
      TextEditingController? controller,
      bool? inputValidity
    }) {
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(height: 5.h,),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: appBoxDecorationTextField(inputValidity: inputValidity),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(imagePath: iconName),
              ),
              SizedBox(
                width: 280.w,
                height: 50.h,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: TextField(
                    controller: controller,
                    onChanged: (value)=>func!(value),
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: AppColors.hintTextColor),
                      hintText: hintText,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      //default border without any input
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      //focused border is with input
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                    maxLines: 1,
                    autocorrect: false,
                    obscureText: obscureText,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
