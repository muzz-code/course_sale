import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/features/auth/sign_in/entities/entities.dart';

import '../../../common/core/constants/colors.dart';
import '../../../common/core/utility/utils.dart';
import '../../../common/utils/image_res.dart';
import '../../../common/widgets/text_widgets.dart';

class HomePageAppBar extends ConsumerStatefulWidget {
  final String? initialDropdownValue;

  const HomePageAppBar({
    super.key,
    this.initialDropdownValue,
  });

  @override
  CircularAvatarWidgetState createState() => CircularAvatarWidgetState();
}

class CircularAvatarWidgetState extends ConsumerState<HomePageAppBar> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialDropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    final UserItem user = UserItem();

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            // fit: BoxFit.fitHeight,
                            image: AssetImage('assets/icons/person.png')),
                        borderRadius: BorderRadius.circular(20.w)),
                  ),
                ),
                text14Normal(
                  text:
                      '${Utils.greetingMessage()}, ${user.name ?? 'Guest'}', color: Colors.black
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(7),
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueBtn,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      ImageRes.user,
                      width: 20,
                      height: 13,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
