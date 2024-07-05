import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/features/home_page/view/home_page.dart';
import '../../features/home_page/view/dashboard.dart';
import '../../features/search/view/search_screen.dart';
import '../utils/app_colors.dart';
import '../utils/image_res.dart';
import 'image_widgets.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: ImageRes.home),
      activeIcon: bottomContainer(
          color: AppColors.primaryElement, imagePath: ImageRes.home),
      backgroundColor: AppColors.primaryBackground,
      label: 'Home'),
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: ImageRes.search),
      activeIcon: bottomContainer(
          color: AppColors.primaryElement,
          imagePath: ImageRes.search),
      backgroundColor: AppColors.primaryBackground,
      label: 'Search'),
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: ImageRes.calender),
      activeIcon: bottomContainer(
          color: AppColors.primaryElement,
          imagePath: ImageRes.calender),
      backgroundColor: AppColors.primaryBackground,
      label: 'Search'),
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: ImageRes.user),
      activeIcon: bottomContainer(
          color: AppColors.primaryElement,
          imagePath:  ImageRes.user),
      backgroundColor: AppColors.primaryBackground,
      label: 'Search'),
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

Widget appScreens({int index=0}){
  List<Widget> screens=[
    const HomeScreen(),
    const SearchScreen(),
    Center(child: appImage(imagePath: ImageRes.calender, width: 250, height: 250), ),
    Center(child: appImage(imagePath: ImageRes.user, width: 250, height: 250),),
  ];
  return screens[index];
}