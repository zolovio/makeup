import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/admin_dashboard/admin_appbar.dart';
import 'package:makeup/src/admin/features/manage_categories/manage_category_details/manage_category_details_vm.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/manage_category_details_card.dart';
import 'package:makeup/src/core/ui/theme.dart';

import 'confirm_edit_dialog.dart';

class ManageCategoryDetailsScreen extends StatelessWidget {
  const ManageCategoryDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(manageCategoryDetailsVmProvider);
      return AdminAppBar(
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
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10.0),
                    itemCount: _vm.categoryList.length,
                    itemBuilder: (BuildContext context, index) {
                      return EditCategoryCard(
                        imageUrl: _vm.categoryList[index].imageUrl,
                        title: _vm.categoryList[index].title,
                        isSame: _vm.categoryList[index].isSame,
                        samePrice: _vm.categoryList[index].samePrice,
                        shoulderPrice: _vm.categoryList[index].shoulderPrice,
                        mediumPrice: _vm.categoryList[index].mediumPrice,
                        longPrice: _vm.categoryList[index].longPrice,
                        onEditPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ConfirmEditDialog(
                                  isSamePrice: _vm.categoryList[index].isSame,
                                  samePrice: _vm.categoryList[index].samePrice,
                                  shoulderPrice:
                                      _vm.categoryList[index].shoulderPrice,
                                  mediumPrice:
                                      _vm.categoryList[index].mediumPrice,
                                  longPrice: _vm.categoryList[index].longPrice,
                                );
                              }).then((value) => null);
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
