import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminHomeVmProvider =
    ChangeNotifierProvider.autoDispose<AdminHomeVm>((ref) {
  return AdminHomeVm();
});

class AdminHomeVm extends ChangeNotifier {
  bool isSearchExpand = false;

  final searchController = TextEditingController();

  void onSearchTap() {
    isSearchExpand = !isSearchExpand;
    notifyListeners();
  }
}
