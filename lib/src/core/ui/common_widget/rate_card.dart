import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/theme.dart';

class BookingCard extends StatelessWidget {
  final Widget child;
  const BookingCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FadeInLeft(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 7.w,
                      height: size.height * 0.03.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.yellow,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 8.w, top: 4.h, right: 8.w),
                        child: child,
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
