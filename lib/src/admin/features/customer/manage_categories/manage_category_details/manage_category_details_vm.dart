import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/admin/features/customer/manage_categories/manage_category_details/edit_price_diaglog/edit_price_diaglog.dart';
import 'package:makeup/src/core/services/app_router.dart';

final manageCategoryDetailsVmProvider =
    ChangeNotifierProvider.autoDispose<ManageCategoryDetailsVm>((ref) {
  return ManageCategoryDetailsVm();
});

class ManageCategoryDetailsVm extends ChangeNotifier {
  bool isSearchExpand = false;
  List<CategoryItem> categoryList = [
    CategoryItem(
      title: 'Hair',
      imageUrl: 'assets/images/hair.jpg',
      isSame: "Yes",
      samePrice: "3000",
      shoulderPrice: "",
      mediumPrice: "",
      longPrice: "",
    ),
    CategoryItem(
      title: 'Hair  Extensions',
      imageUrl: 'assets/images/hair_extensions.jpg',
      isSame: "No",
      samePrice: "",
      shoulderPrice: "7500",
      mediumPrice: "2080",
      longPrice: "2570",
    ),
    CategoryItem(
      title: 'Eyelash  Extensions',
      imageUrl: 'assets/images/eye.jpg',
      isSame: "No",
      samePrice: "",
      shoulderPrice: "1500",
      mediumPrice: "2000",
      longPrice: "2500",
    ),
    CategoryItem(
      title: 'Nail  Extensions',
      imageUrl: 'assets/images/nails.jpg',
      isSame: "Yes",
      samePrice: "800",
      shoulderPrice: "",
      mediumPrice: "",
      longPrice: "",
    ),
    CategoryItem(
      title: 'Makeup',
      imageUrl: 'assets/images/makeup.jpg',
      isSame: "Yes",
      samePrice: "7600",
      shoulderPrice: "",
      mediumPrice: "",
      longPrice: "",
    ),
    CategoryItem(
      title: 'Makeup  Permanent',
      imageUrl: 'assets/images/makeup_permanent.jpg',
      isSame: "No",
      samePrice: "",
      shoulderPrice: "9500",
      mediumPrice: "7600",
      longPrice: "2550",
    ),
  ];

  final searchController = TextEditingController();

  void onContinueTap() {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(AppRouter.login, (route) => false);
  }

  void onSearchTap() {
    isSearchExpand = !isSearchExpand;
    notifyListeners();
  }

  void onCategoryTap() {
    navigatorKey.currentState!.pop();
  }

  void onEditTap(
    BuildContext context, {
    required String isSamePrice,
    required String samePrice,
    required String shoulderPrice,
    required String mediumPrice,
    required String longPrice,
  }) {
    Navigator.of(context).pop(false);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return EditPriceDialogScreen(
            isSame: isSamePrice == "Yes",
            samePrice: samePrice,
            shoulderPrice: shoulderPrice,
            mediumPrice: mediumPrice,
            longPrice: longPrice,
          );
        }).then((value) => null);

    print("Edited");
  }

  void onLikeTap() {
    print('onLikeTapped');
  }
}

class CategoryItem {
  final String isSame;
  final String imageUrl;
  final String title;
  final String samePrice;
  final String shoulderPrice;
  final String mediumPrice;
  final String longPrice;
  CategoryItem({
    required this.isSame,
    required this.imageUrl,
    required this.title,
    required this.samePrice,
    required this.shoulderPrice,
    required this.mediumPrice,
    required this.longPrice,
  });
}
