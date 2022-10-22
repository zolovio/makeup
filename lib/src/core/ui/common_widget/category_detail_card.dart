import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/common_dropdown.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CategoryDetailCard extends StatelessWidget {
  final String title;
  final String descriptions;
  final String timeLabel;
  final String noOfLikes;
  final String price;
  final Function onCartTap;
  final Function onLikeTap;

  const CategoryDetailCard(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.timeLabel,
      required this.onCartTap,
      required this.onLikeTap,
      required this.noOfLikes,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppDecoration.textStyle(
              color: AppColors.black,
              fontSize: 30.sp,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            descriptions,
            textAlign: TextAlign.left,
            style: AppDecoration.textStyle(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  //₹
                  timeLabel,
                  style: AppDecoration.textStyle(
                    color: AppColors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/clock.png',
                      width: 35.w,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      noOfLikes,
                      style: AppDecoration.textStyle(
                        color: AppColors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: AppDecoration.textStyle(
                      color: AppColors.yellow,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '₹ $price',
                    style: AppDecoration.textStyle(
                      color: AppColors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: CommonDropDown(),
        ),
      ],
    );
  }
}
