import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/add_more_card.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/bill_summary_card.dart';
import 'package:makeup/src/core/ui/common_widget/book_now_button.dart';
import 'package:makeup/src/core/ui/common_widget/order_card.dart';
import 'package:makeup/src/core/ui/common_widget/rate_card.dart';
import 'package:makeup/src/core/ui/common_widget/reward_card.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/booknow/book_now_vm.dart';
import 'package:makeup/src/feature/dashboard/base_screen.dart';

class BookNowScreen extends StatelessWidget {
  const BookNowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(bookNowVmProvider);
      return BaseScreen(
          searchController: _vm.searchController,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(10.h),
            children: [
              SizedBox(height: 20.h),
              const OrderCard(),
              SizedBox(height: 20.h),
              const RewardCard(
                  firstLabel: "Reward", secondLabel: "Points", price: "200"),
              SizedBox(height: 20.h),
              const BillSummaryCard(
                  totalPrice: "2000",
                  taxServiceCharge: "50",
                  rewardPoints: "300",
                  convenienceFees: "50",
                  grandTotal: "2500"),
              SizedBox(height: 20.h),
              BookingCard(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Slot',
                        style: AppDecoration.textStyle(
                          color: AppColors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' Timing',
                        style: AppDecoration.textStyle(
                          color: AppColors.yellow,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime(1964, 1, 1),
                            maxTime: DateTime(2030, 12, 31),
                            onConfirm: (newDateTime) {
                              _vm.onDateChange(newDateTime);
                            },
                            currentTime: _vm.dateTimeSelected,
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: AppColors.hintColor,
                              size: 25.sp,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              _vm.selectedDate.toString(),
                              style: AppDecoration.textStyle(
                                color: AppColors.hintColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          DatePicker.showTime12hPicker(context,
                              showTitleActions: true, onConfirm: (date) {
                            _vm.onTimeConfirm(date);
                          }, locale: LocaleType.en);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: AppColors.hintColor,
                              size: 25.sp,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              _vm.selectedTime.toString(),
                              style: AppDecoration.textStyle(
                                color: AppColors.hintColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
              SizedBox(height: 20.h),
              const AddMoreCard(
                label: 'Your Details',
                nameNumber: 'Sanjay,  1234567890',
              ),
              SizedBox(height: 20.h),
              BookNowButton(
                onButtonTap: () {},
              ),
              SizedBox(height: 50.h),
            ],
          ));
    });
  }
}
