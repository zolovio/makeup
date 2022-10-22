import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/category_card.dart';
import 'package:makeup/src/core/ui/common_widget/review_slider.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/categories/base_screen.dart';
import 'package:makeup/src/feature/categories/category_home/category_home_vm.dart';

class CategoryHomeScreen extends StatelessWidget {
  const CategoryHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(categoryHomeVmProvider);
      return BaseScreen(
        searchController: _vm.searchController,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 20.w),
                child: Text(
                  'Categories',
                  style: AppDecoration.textStyle(
                    color: AppColors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                clipBehavior: Clip.none,
                childAspectRatio: 1.5,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (int i = 0; i < _vm.categoryList.length; i++)
                    CategoryCard(
                      imageUrl: _vm.categoryList[i].imageUrl,
                      label: _vm.categoryList[i].label,
                      onCardTap: () {
                        _vm.onCardTap(context, _vm.categoryList[i].label);
                      },
                    ),
                ],
              ),
              SizedBox(
                height: size.height * 0.18,
                child: CategoryCard(
                  imageUrl: 'assets/images/products.jpg',
                  label: 'Products',
                  fontSize: 20.sp,
                  onCardTap: () {},
                ),
              ),
              Container(
                height: size.height * 0.15.h,
                margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    image: DecorationImage(
                        image: Image.asset('assets/images/image1.png').image,
                        fit: BoxFit.cover)),
              ),
              SizedBox(height: size.height * 0.13.h, child: ReviewSlider()),
              SizedBox(height: 40.h)
            ],
          ),
        ),
      );
    });
  }
}
