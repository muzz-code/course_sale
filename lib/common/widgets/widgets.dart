import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/image_res.dart';
import 'image_widgets.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: 'assets/icons/home.png'),
      activeIcon: bottomContainer(
          color: AppColors.primaryElement, imagePath: 'assets/icons/home.png'),
      backgroundColor: AppColors.primaryBackground,
      label: 'Home'),
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: 'assets/icons/search2.png'),
      activeIcon: bottomContainer(
          color: AppColors.primaryElement,
          imagePath: 'assets/icons/search2.png'),
      backgroundColor: AppColors.primaryBackground,
      label: 'Search'),
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: 'assets/icons/play-circle1.png'),
      activeIcon: bottomContainer(
          color: AppColors.primaryElement,
          imagePath: 'assets/icons/play-circle1.png'),
      backgroundColor: AppColors.primaryBackground,
      label: 'Search'),
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: 'assets/icons/message-circle.png'),
      activeIcon: bottomContainer(
          color: AppColors.primaryElement,
          imagePath: 'assets/icons/message-circle.png'),
      backgroundColor: AppColors.primaryBackground,
      label: 'Search'),
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: 'assets/icons/user.png'),
      activeIcon: bottomContainer(
          color: AppColors.primaryElement,
          imagePath: 'assets/icons/user.png'),
      backgroundColor: AppColors.primaryBackground,
      label: 'Contact'),
];

Widget bottomContainer(
    {double width = 15,
    double height = 15,
    String? imagePath,
    Color color = AppColors.primaryFourthElementText}) {
  return SizedBox(
    width: width.w,
    height: height.w,
    child: appImageWithColor(imagePath: imagePath ?? "", color: color),
  );
}

Widget appScreens(int index) {
  List<Widget> _screens = [
    Center(child: appImage(imagePath: ImageRes.home)),
    Center(child: appImage(imagePath: ImageRes.search)),
    Center(child: appImage(imagePath: ImageRes.play)),
    Center(child: appImage(imagePath: ImageRes.message)),
    Center(child: appImage(imagePath: ImageRes.user)),
  ];
      return _screens[index];
}