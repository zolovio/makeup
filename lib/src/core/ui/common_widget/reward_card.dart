import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/rate_card.dart';
import 'package:makeup/src/core/ui/theme.dart';

class RewardCard extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final String price;
  const RewardCard(
      {Key? key,
      required this.firstLabel,
      required this.secondLabel,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BookingCard(
      child: Row(
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: firstLabel,
                style: AppDecoration.textStyle(
                  color: AppColors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: ' $secondLabel',
                style: AppDecoration.textStyle(
                  color: AppColors.yellow,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ]),
          ),
          const Spacer(),
          Text(
            '₹$price',
            style: AppDecoration.textStyle(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
