import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/auth/ui/email_verification/email_verification_vm.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer(builder: (context, ref, _) {
          final _vm = ref.watch(emailVerificationVmProvider);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Column(
              children: [
                SizedBox(height: 80.h),
                Image.asset(
                  'assets/splash_email.png',
                  height: 100.h,
                  width: 60.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Check your email',
                      style: AppDecoration.textStyle(
                        color: AppColors.white,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          'We’ve sent the verification link to',
                          style: AppDecoration.textStyle(
                            color: AppColors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'abc@email.com',
                          style: AppDecoration.textStyle(
                            color: AppColors.hintColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80.h),
                InkWell(
                  onTap: () {
                    _vm.onEnterCode(context);
                  },
                  child: Container(
                    height: 50.h,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.darkGrey,
                    ),
                    child: Center(
                      child: Text(
                        'Enter code manually',
                        style: AppDecoration.textStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w300,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.2.h,
                ),
                Text(
                  'Back to login',
                  style: AppDecoration.textStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                ),
                Padding(
                  padding: EdgeInsets.all(6.r),
                  child: IconButton(
                    onPressed: () {
                      _vm.onBackTap();
                    },
                    icon: Image.asset('assets/back_arrow.png'),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
