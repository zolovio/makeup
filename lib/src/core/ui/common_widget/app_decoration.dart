import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/theme.dart';

class AppDecoration {
  static InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide:
        const BorderSide(width: 2, color: AppColor.textFieldBorderColor),
  );

  static TextStyle textStyle(
          {Color? color, double? fontSize, FontWeight? fontWeight}) =>
      TextStyle(
        color: color ?? AppColor.hintColor,
        fontSize: fontSize ?? 18.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
      );
}