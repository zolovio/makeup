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
      width: size.width * 0.30,
      height: size.height * 0.1,
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
          height: size.height * 0.005,
        ),
        Container(
          height: size.height * 0.04,
          width: size.width * 0.30,
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