import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class UserListTile extends StatefulWidget {
  final String serialNum;
  final String name;
  final String phoneNum;
  final Function onTapFunc;
  const UserListTile(
      {Key? key,
      required this.serialNum,
      required this.name,
      required this.phoneNum,
      required this.onTapFunc})
      : super(key: key);

  @override
  State<UserListTile> createState() => _UserListTileState();
}

class _UserListTileState extends State<UserListTile> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.yellow)),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 25.h, right: 20.h),
          onTap: () => widget.onTapFunc(),
          dense: true,
          leading: Text(
            widget.serialNum,
            style: AppDecoration.textStyle(
              color: AppColors.yellow,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          title: Center(
            child: Text(
              widget.name,
              style: AppDecoration.textStyle(
                color: AppColors.yellow,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          trailing: Text(
            widget.phoneNum,
            style: AppDecoration.textStyle(
              color: AppColors.yellow,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
