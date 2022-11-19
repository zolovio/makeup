import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CustomContainer extends StatelessWidget {
  final String upperLabel;
  final String btmLabel;

  const CustomContainer({
    Key? key,
    required this.upperLabel,
    required this.btmLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: (btmLabel == 'Total Employees')
          ? size.width * 0.40
          : size.width * 0.35,
      height: (btmLabel == 'Total Employees')
          ? size.height * 0.15
          : size.height * 0.125,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.hint2Color)),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          upperLabel,
          style: AppDecoration.textStyle(
            color: AppColors.yellow,
            fontSize: 35.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: (btmLabel == 'Total Employees')
              ? size.height * 0.030
              : size.height * 0.02,
        ),
        Container(
          height: (btmLabel == 'Total Employees')
              ? size.height * 0.05
              : size.height * 0.045,
          width: (btmLabel == 'Total Employees')
              ? size.width * 0.40
              : size.width * 0.35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.hint2Color)),
          child: Text(
            btmLabel,
            style: AppDecoration.textStyle(
              color: AppColors.yellow,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ]),
    );
  }
}
