import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onButtonTap;
  const CustomButton(
      {Key? key, required this.buttonText, required this.onButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55.h,
        width: MediaQuery.of(context).size.width * 0.70,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
          child: TextButton(
            onPressed: () => onButtonTap(),
            child: Text(
              buttonText,
              style: AppDecoration.textStyle(
                color: AppColors.black,
                fontSize: 35.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ));
  }
}

class DialogsButton extends StatelessWidget {
  final String buttonText;
  final Function onButtonTap;
  const DialogsButton(
      {Key? key, required this.buttonText, required this.onButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onButtonTap(),
      child: Container(
          alignment: Alignment.center,
          height: 28.h,
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: AppColors.hintColor),
            boxShadow: [
              BoxShadow(
                  color: AppColors.white,
                  blurRadius: 4.h,
                  blurStyle: BlurStyle.outer)
            ],
          ),
          child: Text(
            buttonText,
            style: AppDecoration.textStyle(
              color: AppColors.yellow,
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }
}
