import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/add_more_card.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/rate_card.dart';
import 'package:makeup/src/core/ui/theme.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BookingCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Order',
            style: AppDecoration.textStyle(
              color: AppColors.black,
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: DotWidget(),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Smoothening',
                          style: AppDecoration.textStyle(
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ' (Long)',
                          style: AppDecoration.textStyle(
                            color: AppColors.yellow,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '\n ₹2,000',
                          style: AppDecoration.textStyle(
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(255, 215, 0, 1),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          child:
                              const Icon(Icons.remove, color: AppColors.yellow),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: size.width * 0.09.w,
                          child: Text(
                            '10',
                            style: AppDecoration.textStyle(
                              color: AppColors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        InkWell(
                          child: const Icon(Icons.add, color: AppColors.yellow),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 35.w, top: 5.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Hair smoothening is a chemical process,\nthat involves saturating \nthe hair with a formaldehyde solution.',
                          style: AppDecoration.textStyle(
                            color: AppColors.hintColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '  ₹2,000',
                          style: AppDecoration.textStyle(
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(height: 15.h),
              const AddMoreCard(
                label: 'Add more items',
              ),
              SizedBox(height: 15.h),
              const AddMoreCard(
                label: 'Add Instructions',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.h,
      height: 10.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.yellow,
      ),
    );
  }
}
