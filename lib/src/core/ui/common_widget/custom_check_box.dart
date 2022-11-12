import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CustomCheckBox extends StatelessWidget {
  final String label;
  final bool? isCutomerOrEmployee;
  const CustomCheckBox({
    Key? key,
    required this.label,
    required this.isCutomerOrEmployee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => const BorderSide(width: 1.0, color: AppColors.yellow),
        ),
        checkColor: AppColors.yellow,
        enabled: false,
        title: Text(
          label,
          style: AppDecoration.textStyle(
            color: AppColors.yellow,
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        value: isCutomerOrEmployee,
        onChanged: ((value) {
          value = value;
        }));
  }
}
