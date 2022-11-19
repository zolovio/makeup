import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manageBookingVmProvider =
    ChangeNotifierProvider.autoDispose<ManageBookingVm>((ref) {
  return ManageBookingVm();
});

class ManageBookingVm extends ChangeNotifier {
  bool isSearchExpand = false;
  List<BookingOrderData> bookingOrderList = [
    BookingOrderData(
        customerName: "AbC XyZ",
        productName: "Nails Extensions with Nail Paint",
        productSize: "Long",
        dateTime: 'Thu, 24 Oct,2022 | 10:00 AM',
        email: "abc12@gmail.com",
        address: "delhi",
        amount: "2000",
        taxServiceCharge: "50",
        rewardPoints: "300",
        convenienceFees: "150",
        totalAmount: "1900"),
    BookingOrderData(
        customerName: "Sami Ullah",
        productName: "Hairs Extensions",
        productSize: "Shoulder",
        dateTime: 'Thu, 24 Oct,2022 | 10:00 AM',
        email: "abc12@gmail.com",
        address: "delhi",
        amount: "2000",
        taxServiceCharge: "50",
        rewardPoints: "300",
        convenienceFees: "150",
        totalAmount: "1900"),
    BookingOrderData(
        customerName: "Sami Ullah",
        productName: "Hairs Extensions",
        productSize: "Medium",
        dateTime: 'Thu, 24 Oct,2022 | 10:00 AM',
        email: "abc12@gmail.com",
        address: "delhi",
        amount: "2000",
        taxServiceCharge: "50",
        rewardPoints: "300",
        convenienceFees: "150",
        totalAmount: "1900")
  ];

  final searchController = TextEditingController();

  void onSearchTap() {
    isSearchExpand = !isSearchExpand;
    notifyListeners();
  }

  void onConfirmTap() {
    print("Confirmed");
  }

  void onCancelTap() {}
}

class BookingOrderData {
  final String customerName;
  final String productName;
  final String productSize;
  final String dateTime;
  final String email;
  final String address;

  final String amount;
  final String taxServiceCharge;
  final String rewardPoints;
  final String convenienceFees;
  final String totalAmount;

  BookingOrderData({
    required this.customerName,
    required this.productName,
    required this.productSize,
    required this.dateTime,
    required this.email,
    required this.address,
    required this.amount,
    required this.taxServiceCharge,
    required this.rewardPoints,
    required this.convenienceFees,
    required this.totalAmount,
  });
}
