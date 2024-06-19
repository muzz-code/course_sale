import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/utils/image_res.dart';
import '../../../common/widgets/button_widgets.dart';
import '../../../common/widgets/text_widgets.dart';

class GetStartedScreen extends StatefulWidget {
  static const routeName = '/GetStartedScreen';

  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundOrange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45.0, vertical: 30),
                child: Image.asset(
                  ImageRes.logo,
                  fit: BoxFit.fitWidth,
                ),
              ),
              text50Bold(text: "Food for Everyone", color: Colors.white),
            ],
          ),
          Image.asset(
            ImageRes.welcome_faces,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: Center(
                child: appButton(
                    buttonName: "Get started",
                    isLogin: false,
                    context: context,
                    textColor: AppColors.backgroundOrange,
                    func: () => Navigator.pushNamed(context, "/SignUp"))),
          )
        ],
      ),
    );
  }
}
