import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/category_animated_card.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/dashboard/base_screen.dart';
import 'package:makeup/src/feature/rate_list/rates_vm.dart';

class RatesScreen extends StatelessWidget {
  const RatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(ratesVmProvider);
      return BaseScreen(
        searchController: _vm.searchController,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 30.w, bottom: 5.h),
                child: Text(
                  'Rate List ',
                  style: AppDecoration.textStyle(
                    color: AppColors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 20.0),
                  children: [
                    for (int i = 0; i < 5; i++)
                      CategoryAnimatedCard(
                        imageUrl: 'assets/images/hair.jpg',
                        title: 'Smoothening',
                        child: Container(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
