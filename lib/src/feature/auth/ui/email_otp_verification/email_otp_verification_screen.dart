import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/common_button.dart';
import 'package:makeup/src/core/ui/common_widget/common_pinput.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/auth/ui/email_otp_verification/email_otp_verification_vm.dart';

class EmailOtpVerificationScreen extends StatefulWidget {
  const EmailOtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailOtpVerificationScreen> createState() =>
      _EmailOtpVerificationScreenState();
}

class _EmailOtpVerificationScreenState
    extends State<EmailOtpVerificationScreen> {
  TextEditingController pinController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.all(6.r),
          child: IconButton(
            onPressed: () {
              navigatorKey.currentState?.pop();
            },
            icon: Image.asset('assets/back_arrow.png'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer(builder: (context, ref, _) {
          final _vm = ref.watch(emailOtpVerificationVmProvider);
          return FormBuilder(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Verification',
                        style: AppDecoration.textStyle(
                          color: AppColors.white,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'We’ve sent you the verification \ncode on +1 2553 3232 0786',
                        style: AppDecoration.textStyle(
                          color: AppColors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02.h,
                  ),
                  CommonPinPut(pinController: pinController),
                  SizedBox(
                    height: 50.h,
                  ),
                  CommonButton(
                    buttonText: 'CONTINUE',
                    onButtonTap: () {
                      print(pinController.text);
                      // FocusScope.of(context).unfocus();
                      // if (_formKey.currentState!.saveAndValidate()) {
                      _vm.onContinueTap();
                      // }
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Re-send code in',
                        style: AppDecoration.textStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      Text(
                        '0:20',
                        style: AppDecoration.textStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkBlue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
