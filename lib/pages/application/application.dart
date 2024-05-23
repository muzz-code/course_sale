import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/widgets.dart';

import '../../common/utils/app_colors.dart';
import 'notifier/application_nav_notifier.dart';


class Application extends ConsumerWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Container(
          child: appScreens(index),
        ),
        bottomNavigationBar: Container(
          width: 375.w,
          height: 58.h,
          decoration: appBoxShadowWithRadius(),
          child: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
              },
            elevation: 0,
            items: bottomTabs,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourthElementText,
          ),
        ),
      ),
    );
  }
}

