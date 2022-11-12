import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/admin_after_login/admin_after_login_vm.dart';

import '../../../core/ui/common_widget/custom_button.dart';
import '../../../core/ui/theme.dart';

class AdminAfterLoginScreen extends StatelessWidget {
  const AdminAfterLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(adminAfterLoginVmProvider);
      return Container(
        color: AppColors.black,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child:
                    Image.asset('assets/logo.png', width: size.width * 0.6.w),
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              CustomButton(
                  buttonText: 'Customer',
                  onButtonTap: () {
                    _vm.onCustomerTap();
                  }),
              SizedBox(
                height: size.height * 0.1,
              ),
              CustomButton(
                  buttonText: 'Employees',
                  onButtonTap: () {
                    _vm.onEmployeeTap();
                  }),
            ],
          ),
        ),
      );
    });
  }
}
