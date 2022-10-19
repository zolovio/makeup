import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CommonButton extends StatelessWidget {
  final String buttonText;
  final Function onButtonTap;
  const CommonButton(
      {Key? key, required this.buttonText, required this.onButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
      child: InkWell(
        onTap: () => onButtonTap(),
        child: Row(
          children: [
            const Spacer(),
            const Spacer(),
            Text(
              buttonText,
              style: AppDecoration.textStyle(
                color: AppColors.black,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Image.asset('assets/arrow_icon.png'),
            ),
            SizedBox(
              width: 10.w,
            )
          ],
        ),
      ),
    );
  }
}
