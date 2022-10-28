import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/rate_card.dart';
import 'package:makeup/src/core/ui/theme.dart';

class MyBookingCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String dateTime;
  final String taxServiceCharge;
  final String rewardPoints;
  final String convenienceFees;
  final String itemTotal;
  final String amountPaid;
  const MyBookingCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.subTitle,
      required this.dateTime,
      required this.taxServiceCharge,
      required this.rewardPoints,
      required this.convenienceFees,
      required this.amountPaid,
      required this.itemTotal})
      : super(key: key);

  @override
  State<MyBookingCard> createState() => _MyBookingCardState();
}

class _MyBookingCardState extends State<MyBookingCard> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        FadeInLeft(
          child: Container(
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
                          widget.title,
                          style: AppDecoration.textStyle(
                            color: AppColors.white,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          '(${widget.subTitle})',
                          style: AppDecoration.textStyle(
                            color: AppColors.yellow,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          widget.dateTime,
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
                        setState(() {
                          isOpen = !isOpen;
                        });
                      },
                      icon: isOpen
                          ? Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.white,
                              size: 35.sp,
                            )
                          : Transform.rotate(
                              angle: 4.7,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.white,
                                size: 35.sp,
                              ),
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
        ),
        if (isOpen)
          FadeInLeft(
            child: Container(
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
                            '₹${widget.itemTotal}',
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
                            '₹${widget.taxServiceCharge}',
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
                            '₹${widget.rewardPoints}',
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
                            '₹${widget.convenienceFees}',
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
                          '₹${widget.amountPaid}',
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
          ),
      ],
    );
  }
}
