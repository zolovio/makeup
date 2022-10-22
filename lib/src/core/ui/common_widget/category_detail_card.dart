import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CategoryDetailCard extends StatelessWidget {
  final String title;
  final String descriptions;
  final String price;
  final String noOfLikes;
  final Function onCartTap;
  final Function onLikeTap;

  const CategoryDetailCard(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.price,
      required this.onCartTap,
      required this.onLikeTap,
      required this.noOfLikes})
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
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '₹$price',
                    style: AppDecoration.textStyle(
                      color: AppColors.black,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        onCartTap();
                      },
                      child: Image.asset(
                        'assets/cart.png',
                        width: 55.w,
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            onLikeTap();
                          },
                          child: Image.asset(
                            'assets/like.png',
                            width: 35.w,
                          )),
                      const SizedBox(width: 5),
                      Text(
                        noOfLikes,
                        style: AppDecoration.textStyle(
                          color: AppColors.black,
                          fontSize: 14.sp,
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
        ),
      ],
    );
  }
}
