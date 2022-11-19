import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editRewardVmProvider =
    ChangeNotifierProvider.autoDispose<EditRewardVm>((ref) {
  return EditRewardVm();
});

class EditRewardVm extends ChangeNotifier {
  void onSubmitTap() {
    print("Submitted");
  }
}
