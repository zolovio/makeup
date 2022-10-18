import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class SocialButton extends StatelessWidget {
  final String buttonText;
  final String assets;
  final Function onButtonTap;
  const SocialButton(
      {Key? key,
      required this.buttonText,
      required this.onButtonTap,
      required this.assets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(15.r)),
      child: InkWell(
        onTap: () => onButtonTap(),
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Image.asset(assets),
            ),
            const Spacer(),
            Text(
              buttonText,
              style: AppDecoration.textStyle(
                color: AppColor.black,
                fontSize: 25.sp,
                // fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
