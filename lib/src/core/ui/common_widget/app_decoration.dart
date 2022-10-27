import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/theme.dart';

class AppDecoration {
  static InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide:
        const BorderSide(width: 2, color: AppColors.textFieldBorderColor),
  );

  static TextStyle textStyle(
          {Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          FontStyle? fontStyle,
          double? letterSpacing}) =>
      TextStyle(
        color: color ?? AppColors.hintColor,
        fontSize: fontSize ?? 18.sp,
        fontFamily: 'Sansita',
        letterSpacing: letterSpacing ?? 0.0,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal,
      );
}
