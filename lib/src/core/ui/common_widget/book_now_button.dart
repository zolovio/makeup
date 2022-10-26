import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class BookNowButton extends StatelessWidget {
  final Function onButtonTap;
  const BookNowButton({Key? key, required this.onButtonTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 1),
              offset: Offset(0, 1),
              blurRadius: 2)
        ],
        color: const Color.fromRGBO(0, 0, 0, 1),
      ),
      child: InkWell(
        onTap: () {
          onButtonTap();
        },
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              Text(
                'BOOK NOW',
                style: AppDecoration.textStyle(
                  color: AppColors.yellow,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'to confirm your appointment',
                style: AppDecoration.textStyle(
                  color: AppColors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
