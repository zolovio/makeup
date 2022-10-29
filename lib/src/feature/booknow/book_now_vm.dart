import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/services/app_router.dart';

final bookNowVmProvider = ChangeNotifierProvider.autoDispose<BookNowVm>((ref) {
  return BookNowVm();
});

class BookNowVm extends ChangeNotifier {
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

  DateTime dateTimeSelected = DateTime.now();
  DateTime timeSelected = DateTime.now();
  String? selectedDate;
  String? selectedTime;

  BookNowVm() {
    load();
  }

  load() {
    selectedDate = Jiffy(dateTimeSelected).yMMMd;
    selectedTime = Jiffy(timeSelected).jm;
  }

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

  void onDateChange(DateTime newDateTime) {
    DateTime dd = newDateTime;
    selectedDate = Jiffy(DateTime(
      dd.year,
      dd.month,
      dd.day,
      dd.hour,
      dd.minute,
      dd.second,
    )).yMMMd;
    dateTimeSelected = dd;
    notifyListeners();
  }

  void onTimeConfirm(DateTime date) {
    DateTime dd = date;
    selectedTime = Jiffy(DateTime(
      dd.year,
      dd.month,
      dd.day,
      dd.hour,
      dd.minute,
      dd.second,
    )).jm;
    timeSelected = dd;
    notifyListeners();
  }
}

class CategoryItem {
  final String imageUrl;
  final String label;

  CategoryItem({required this.imageUrl, required this.label});
}
