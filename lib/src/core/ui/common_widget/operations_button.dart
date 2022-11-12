import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class OperationButton extends StatelessWidget {
  final String btnLabel;
  final Function onButtonTap;

  const OperationButton(
      {Key? key, required this.btnLabel, required this.onButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(8.h),
      child: InkWell(
        onTap: () => onButtonTap(),
        child: Container(
            height: size.height * 0.05,
            width: size.width * 0.50,
            padding: EdgeInsets.only(left: 5.h),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
                border: Border(
              left: BorderSide(
                color: AppColors.yellow,
                width: 2.0,
              ),
              bottom: BorderSide(
                color: AppColors.yellow,
                width: 2.0,
              ),
            )),
            child: Text(
              btnLabel,
              style: AppDecoration.textStyle(
                color: AppColors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
              ),
            )),
      ),
    );
  }
}
