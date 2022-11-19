import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editBannerVmProvider =
    ChangeNotifierProvider.autoDispose<EditBannerVm>((ref) {
  return EditBannerVm();
});

class EditBannerVm extends ChangeNotifier {
  void onSubmitTap() {
    print("Submitted");
  }
}
