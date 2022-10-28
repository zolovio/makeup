import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/book_now_button.dart';
import 'package:makeup/src/core/ui/common_widget/my_booking_card.dart';
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
              const MyBookingCard(
                imageUrl: '',
                title: 'Smoothening',
                subTitle: 'Long',
                dateTime: 'Thu, 24 Oct,2022 | 10:00 AM',
                itemTotal: '2000',
                convenienceFees: '50',
                rewardPoints: '100',
                taxServiceCharge: '100',
                amountPaid: '2050',
              ),
              SizedBox(height: 15.h),
              NoBookingCard(),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      );
    });
  }
}

class NoBookingCard extends StatelessWidget {
  const NoBookingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'You have no upcoming bookings',
          style: AppDecoration.textStyle(
            color: AppColors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: size.height * 0.1),
        Image.asset(
          'assets/nobooking.png',
          height: 150.0,
          width: 150.0,
        ),
        SizedBox(height: size.height * 0.05),
        BookNowButton(onButtonTap: () {}),
      ],
    );
  }
}
