import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/core/constants/colors.dart';
import '../../../common/core/provider/application_nav_notifier.dart';
import '../../../common/widgets/app_shadow.dart';
import '../../../common/widgets/bottom_tabs.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  static const routeName = '/DashBoardScreen';

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends ConsumerState<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    int index = ref.watch(applicationNavIndexProvider);

    return Scaffold(
      // body: const DashBoardPage(),
      body: appScreens(index: index),
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
    );
  }
}
