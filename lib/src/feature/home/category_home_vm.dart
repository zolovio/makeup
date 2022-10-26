import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/services/app_router.dart';
import 'package:makeup/src/core/ui/common_widget/waiting_screen.dart';

final categoryHomeVmProvider =
    ChangeNotifierProvider.autoDispose<CategoryHomeVm>((ref) {
  return CategoryHomeVm();
});

class CategoryHomeVm extends ChangeNotifier {
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

  void onCardTap(BuildContext context, String label) async {
    WaitingScreen.show(context);
    await Future.delayed(Duration(milliseconds: 800));
    WaitingScreen.hide(context);
    navigatorKey.currentState!.pushNamed(AppRouter.categoryDetails);
  }
}

class CategoryItem {
  final String imageUrl;
  final String label;

  CategoryItem({required this.imageUrl, required this.label});
}
