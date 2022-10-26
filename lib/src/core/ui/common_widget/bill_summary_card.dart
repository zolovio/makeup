import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/rate_card.dart';
import 'package:makeup/src/core/ui/theme.dart';

class BillSummaryCard extends StatelessWidget {
  final String totalPrice;
  final String taxServiceCharge;
  final String rewardPoints;
  final String convenienceFees;
  final String grandTotal;

  const BillSummaryCard(
      {Key? key,
      required this.totalPrice,
      required this.taxServiceCharge,
      required this.rewardPoints,
      required this.convenienceFees,
      required this.grandTotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BookingCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Bill",
                style: AppDecoration.textStyle(
                  color: AppColors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: ' Summary',
                style: AppDecoration.textStyle(
                  color: AppColors.yellow,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ]),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Item Total',
                style: AppDecoration.textStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '₹$totalPrice',
                style: AppDecoration.textStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Taxes & Service Charges',
                  style: AppDecoration.textStyle(
                    color: AppColors.hintColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '₹$taxServiceCharge',
                  style: AppDecoration.textStyle(
                    color: AppColors.hintColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reward points',
                  style: AppDecoration.textStyle(
                    color: AppColors.hintColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '₹$rewardPoints',
                  style: AppDecoration.textStyle(
                    color: AppColors.hintColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Convenience fee',
                  style: AppDecoration.textStyle(
                    color: AppColors.hintColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '₹$convenienceFees',
                  style: AppDecoration.textStyle(
                    color: AppColors.hintColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, -1),
                    blurRadius: 2)
              ],
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Grand',
                        style: AppDecoration.textStyle(
                          color: AppColors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' Total',
                        style: AppDecoration.textStyle(
                          color: AppColors.yellow,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
                  ),
                  Text(
                    '₹$grandTotal',
                    style: AppDecoration.textStyle(
                      color: AppColors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
