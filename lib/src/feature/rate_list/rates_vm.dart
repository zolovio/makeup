import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/services/app_router.dart';

final ratesVmProvider = ChangeNotifierProvider.autoDispose<RatesVm>((ref) {
  return RatesVm();
});

class RatesVm extends ChangeNotifier {
  bool isSearchExpand = false;
  List<CategoryItem> categoryList = [
    CategoryItem(label: 'Hair', imageUrl: 'assets/images/hair.jpg'),
    CategoryItem(
        label: 'Hair  Extensions',
        imageUrl: 'assets/images/hair_extensions.jpg'),
    CategoryItem(
        label: 'Eyelash  Extensions', imageUrl: 'assets/images/eye.jpg'),
    CategoryItem(
        label: 'Nail  Extensions', imageUrl: 'assets/images/nails.jpg'),
    CategoryItem(label: 'Makeup', imageUrl: 'assets/images/makeup.jpg'),
    CategoryItem(
        label: 'Makeup  Permanent',
        imageUrl: 'assets/images/makeup_permanent.jpg'),
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

  void onCartTap() {
    print('CartTapped');
  }

  void onLikeTap() {
    print('onLikeTapped');
  }
}

class CategoryItem {
  final String imageUrl;
  final String label;

  CategoryItem({required this.imageUrl, required this.label});
}
