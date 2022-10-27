import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/rate_card.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/my_booking/my_booking_vm.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(myBookingVmProvider);
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.black,
          appBar: AppBar(
            backgroundColor: AppColors.black,
            iconTheme: const IconThemeData(
              color: AppColors.yellow,
            ),
            title: Text(
              'My Bookings',
              style: AppDecoration.textStyle(
                color: AppColors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    _vm.onSaveTap();
                  },
                  child: Text(
                    'Save',
                    style: AppDecoration.textStyle(
                      color: AppColors.yellow,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
            elevation: 3.0,
            shadowColor: AppColors.white,
          ),
          body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(10.h),
            children: [
              SizedBox(height: 15.h),
              Center(
                child: Text(
                  'Ordered on:  22 Oct, 2022  at  12:54:10 PM',
                  style: AppDecoration.textStyle(
                    color: AppColors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.hintColor),
                  borderRadius: BorderRadius.circular(19.0),
                  color: const Color.fromRGBO(255, 255, 255, 0.30),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                              width: size.width * 0.3.w,
                              height: size.height * 0.1.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          255, 255, 255, 0.44999998807907104),
                                      offset: Offset(0, 2),
                                      blurRadius: 10)
                                ],
                                image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/hair.jpg',
                                    ),
                                    fit: BoxFit.cover),
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Smoothening',
                              style: AppDecoration.textStyle(
                                color: AppColors.white,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              '(Long)',
                              style: AppDecoration.textStyle(
                                color: AppColors.yellow,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              'Thu, 24 Oct, 2022 I 10:00 AM',
                              style: AppDecoration.textStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            _vm.onOpenTap();
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.white,
                            size: 35.sp,
                          )),
                    ),
                    const Divider(color: AppColors.hintColor, thickness: 2.5),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 2),
                                    blurRadius: 2)
                              ],
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              border: Border.all(
                                color: const Color.fromRGBO(125, 125, 125, 1),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '  FINISHED  ',
                                style: AppDecoration.textStyle(
                                  color: AppColors.yellow,
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(
                            color: AppColors.hintColor, thickness: 2.5),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Hope you enjoyed !',
                            style: AppDecoration.textStyle(
                              color: AppColors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.hintColor),
                  borderRadius: BorderRadius.circular(19.0),
                  color: const Color.fromRGBO(255, 255, 255, 0.30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Item Total',
                              style: AppDecoration.textStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '₹2,000',
                              style: AppDecoration.textStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Taxes & Service Charges',
                              style: AppDecoration.textStyle(
                                color: AppColors.hint2Color,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '₹50',
                              style: AppDecoration.textStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reward points',
                              style: AppDecoration.textStyle(
                                color: AppColors.hint2Color,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '₹50',
                              style: AppDecoration.textStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Convenience fee',
                              style: AppDecoration.textStyle(
                                color: AppColors.hint2Color,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '₹50',
                              style: AppDecoration.textStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      BookingCard(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Amount',
                                style: AppDecoration.textStyle(
                                  color: AppColors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: ' Paid',
                                style: AppDecoration.textStyle(
                                  color: AppColors.yellow,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ]),
                          ),
                          Text(
                            '₹1,900',
                            style: AppDecoration.textStyle(
                              color: AppColors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      );
    });
  }
}
