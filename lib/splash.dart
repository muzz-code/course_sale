import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'common/utils/image_res.dart';
import 'features/welcome/view/get_started.dart';

class SplashScreens extends StatefulWidget {
  static const routeName = '/SplashScreens';

  const SplashScreens({super.key});

  @override
  _SplashScreenStates createState() => _SplashScreenStates();
}

class _SplashScreenStates extends State<SplashScreens> {
  @override
  void initState() {
    //
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(GetStartedScreen.routeName, (r) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 48.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Image.asset(
                            ImageRes.logo,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Transform.translate(
                    offset: const Offset(0, 0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        ImageRes.foodie,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Transform.translate(
                    offset: const Offset(-100, 0),
                    // Adjust this value to control the overlap
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        ImageRes.smaller_foodie,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
