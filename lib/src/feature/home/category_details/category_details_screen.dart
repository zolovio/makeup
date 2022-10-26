import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/category_animated_card.dart';
import 'package:makeup/src/core/ui/common_widget/category_detail_card.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/dashboard/base_screen.dart';
import 'package:makeup/src/feature/home/category_details/category_details_vm.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(categoryDetailsVmProvider);
      return BaseScreen(
        searchController: _vm.searchController,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 20.w),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _vm.onCategoryTap();
                      },
                      child: Text(
                        'Categories > ',
                        style: AppDecoration.textStyle(
                          color: AppColors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      'Hair',
                      style: AppDecoration.textStyle(
                        color: AppColors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10.0),
                  children: [
                    for (int i = 0; i < 5; i++)
                      CategoryAnimatedCard(
                        imageUrl: 'assets/images/hair.jpg',
                        title: 'Smoothening',
                        child: CategoryDetailCard(
                          title: 'Smoothening',
                          descriptions:
                              'Hair smoothening is a chemical process,that involves saturating the hair with a formaldehyde solution, which is then dried out and locked in a straight position usin a flat iron.',
                          timeLabel: 'Streax/Schwarzkopf',
                          noOfLikes: '3-4 Hours',
                          onCartTap: () {
                            _vm.onCartTap();
                          },
                          onLikeTap: () {
                            _vm.onLikeTap();
                          },
                          price: '200',
                        ),
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
