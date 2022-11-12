import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editPriceDialogVmProvider =
    ChangeNotifierProvider.autoDispose<EditPriceDialogVm>((ref) {
  return EditPriceDialogVm();
});

class EditPriceDialogVm extends ChangeNotifier {
  void onSaveTap() {
    print("Saved");
  }
}
