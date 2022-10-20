import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/category_card.dart';
import 'package:makeup/src/core/ui/common_widget/review_slider.dart';
import 'package:makeup/src/core/ui/theme.dart';
import 'package:makeup/src/feature/categories/categories_vm.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(categoriesVmProvider);
      return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset('assets/side_bar_yellow.png'),
          ),
          title: AnimatedContainer(
            height: size.height * 0.05.h,
            width: _vm.isSearchExpand ? size.width * 0.8.w : 80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.yellow, width: 1.5)),
            duration: const Duration(milliseconds: 800),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _vm.onSearchTap();
                  },
                  child: Icon(
                    Icons.search_rounded,
                    color: AppColors.yellow,
                    size: 45.sp,
                  ),
                ),
                _vm.isSearchExpand
                    ? Flexible(
                        child: TextField(
                        style: AppDecoration.textStyle(
                          color: AppColors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        controller: _vm.searchController,
                      ))
                    : Container()
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                !_vm.isSearchExpand
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset('assets/facebook_yellow.png'),
                      )
                    : Container(),
                !_vm.isSearchExpand
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset('assets/insta_yellow.png'),
                      )
                    : Container(),
                !_vm.isSearchExpand
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset('assets/twitter_yellow.png'),
                      )
                    : Container(),
              ],
            )
          ],
        ),
        body: SizedBox(
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
                      onCardTap: () {},
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
