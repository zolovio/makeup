import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/theme.dart';

import 'app_decoration.dart';

class CommonSwitch extends StatelessWidget {
  final bool isActive;
  final String label;
  final Function onSwitch;
  const CommonSwitch(
      {Key? key,
      required this.label,
      required this.onSwitch,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(6.r),
          child: Container(
            width: 50.w,
            height: 20.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColor.white,
            ),
            child: Row(
              mainAxisAlignment:
                  isActive ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(2.r),
                  child: Container(
                    width: 30.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: isActive ? AppColor.yellow : AppColor.hintColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          label,
          style:
              AppDecoration.textStyle(color: AppColor.yellow, fontSize: 20.sp),
        )
      ],
    );
  }
}
