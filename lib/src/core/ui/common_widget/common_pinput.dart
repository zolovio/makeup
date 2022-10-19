import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:pinput/pinput.dart';

class CommonPinPut extends StatefulWidget {
  final TextEditingController pinController;
  const CommonPinPut({Key? key, required this.pinController}) : super(key: key);

  @override
  State<CommonPinPut> createState() => _CommonPinPutState();
}

class _CommonPinPutState extends State<CommonPinPut> {
  final focusedBorderColor = AppColors.yellow;
  final fillColor = AppColors.textFieldColor;
  final borderColor = AppColors.hintColor;
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  final defaultPinTheme = PinTheme(
    width: 56.h,
    height: 56.h,
    textStyle: TextStyle(
      fontSize: 22.sp,
      color: AppColors.white,
    ),
    decoration: BoxDecoration(
      color: AppColors.hintColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.white),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: widget.pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              validator: (value) {
                // return value == '2222' ? null : 'Pin is incorrect';
              },
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 25.h),
                    width: 25.w,
                    height: 1.5.h,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          // TextButton(
          //   onPressed: () => formKey.currentState!.validate(),
          //   child: const Text('Validate'),
          // ),
        ],
      ),
    );
    ;
  }
}
