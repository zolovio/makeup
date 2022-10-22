import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CommonDropDown extends StatefulWidget {
  const CommonDropDown({Key? key}) : super(key: key);

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(20.r),
        ),
        // duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Length',
                    style: AppDecoration.textStyle(
                      color: AppColors.yellow,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    isOpen
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: AppColors.white,
                    size: 45.sp,
                  ),
                ],
              ),
              isOpen
                  ? FadeInDown(
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Length',
                                  style: AppDecoration.textStyle(
                                    color: AppColors.yellow,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Price',
                                  style: AppDecoration.textStyle(
                                    color: AppColors.yellow,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.transparent,
                                size: 45.sp,
                              ),
                            ],
                          ),
                          for (int i = 0; i < 3; i++)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Shoulder',
                                      style: AppDecoration.textStyle(
                                        color: AppColors.white,
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '₹ 1000',
                                      style: AppDecoration.textStyle(
                                        color: AppColors.white,
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/cart_white.png',
                                    width: 60.w,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
