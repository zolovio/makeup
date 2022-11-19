import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class EmployeeListTile extends StatefulWidget {
  final String name;
  final String phoneNum;
  final String attendance;
  final Function onTapFunc;
  const EmployeeListTile(
      {Key? key,
      required this.name,
      required this.phoneNum,
      required this.attendance,
      required this.onTapFunc})
      : super(key: key);

  @override
  State<EmployeeListTile> createState() => _EmployeeListTileState();
}

class _EmployeeListTileState extends State<EmployeeListTile> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: GestureDetector(
        onTap: () => widget.onTapFunc(),
        child: Container(
          height: 52.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.white)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.h,
                child: Text(
                  widget.name,
                  style: AppDecoration.textStyle(
                    color: AppColors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 90.h,
                child: Center(
                  child: Text(
                    widget.phoneNum,
                    style: AppDecoration.textStyle(
                      color: AppColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.attendance,
                    style: AppDecoration.textStyle(
                      color: AppColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20.sp,
                    color: AppColors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
