import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class ConfirmCard extends StatefulWidget {
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

  final Function onConfirmTap;
  final Function onCancelTap;

  const ConfirmCard({
    Key? key,
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
    required this.onConfirmTap,
    required this.onCancelTap,
  }) : super(key: key);

  @override
  State<ConfirmCard> createState() => _ConfirmCardState();
}

class _ConfirmCardState extends State<ConfirmCard> {
  bool isOpen = false;

  Widget customTile(String leadingTxt, String titleTxt, trailingTxt) => Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 32.h,
              width: 81.h,
              child: Text(
                leadingTxt,
                style: AppDecoration.textStyle(
                  color: AppColors.yellow,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (trailingTxt == null)
              SizedBox(
                height: 32.h,
                width: 220.w,
                child: (leadingTxt == "Product")
                    ? RichText(
                        text: TextSpan(
                            text: "${widget.productName} (",
                            style: AppDecoration.textStyle(
                              color: AppColors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: widget.productSize,
                                style: AppDecoration.textStyle(
                                  color: AppColors.yellow,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const TextSpan(text: ")"),
                            ]),
                      )
                    : Text(
                        (leadingTxt == "Amount" && trailingTxt == null)
                            ? "₹$titleTxt"
                            : titleTxt,
                        style: AppDecoration.textStyle(
                          color: AppColors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            (trailingTxt == null)
                ? const Center()
                : Container(
                    alignment: Alignment.topRight,
                    height: 26.h,
                    width: 170.h,
                    child: Text(
                      (leadingTxt == "Reward Points")
                          ? "- ₹$trailingTxt"
                          : "₹$trailingTxt",
                      style: AppDecoration.textStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        FadeInLeft(
          child: Container(
            height: (isOpen) ? size.height * 0.2 : size.height * 0.305,
            width: size.width * 0.92,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.hintColor),
              borderRadius: BorderRadius.circular(19.0),
              color: AppColors.black,
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:
                            (isOpen) ? size.height * 0.15 : size.height * 0.2,
                        width: size.width * 0.73,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 6.h,
                            ),
                            customTile("Name", widget.customerName, null),
                            customTile("Product", widget.productName, null),
                            customTile(
                                "Appointment Timing", widget.dateTime, null),
                            if (isOpen == false)
                              customTile("Amount", widget.amount, null),
                          ],
                        ),
                      ),
                      if (isOpen == false)
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isOpen = !isOpen;
                              });
                              print(isOpen);
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.hintColor,
                              size: 35.sp,
                            )),
                    ],
                  ),
                ),
                if (isOpen == false)
                  SizedBox(
                    height: 4.h,
                  ),
                if (isOpen == false)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () => widget.onConfirmTap(),
                          child: Text(
                            "Confirm",
                            style: AppDecoration.textStyle(
                              color: AppColors.yellow,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      SizedBox(
                        height: 30.h,
                        child: const VerticalDivider(
                          thickness: 2.5,
                          color: AppColors.hintColor,
                        ),
                      ),
                      TextButton(
                          onPressed: () => widget.onCancelTap(),
                          child: Text(
                            "Cancel",
                            style: AppDecoration.textStyle(
                              color: AppColors.yellow,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ],
                  )
              ],
            ),
          ),
        ),
        if (isOpen)
          FadeInLeft(
            child: Container(
              height: size.height * 0.47,
              width: size.width * 0.92,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.hintColor),
                borderRadius: BorderRadius.circular(19.0),
                color: AppColors.black,
              ),
              child: Column(
                children: [
                  if (isOpen)
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              isOpen = !isOpen;
                            });
                          },
                          icon: Transform.rotate(
                            angle: 4.7,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.hintColor,
                              size: 35.sp,
                            ),
                          )),
                    ),
                  customTile("Email", widget.email, null),
                  customTile("Address", widget.address, null),
                  SizedBox(
                    height: 3.h,
                  ),
                  customTile("Amount", '', widget.amount),
                  customTile(
                      "Taxes & Service Charges", '', widget.taxServiceCharge),
                  customTile("Reward Points", '', widget.rewardPoints),
                  customTile("Convenience Fee", '', widget.convenienceFees),
                  SizedBox(
                    height: 2.h,
                  ),
                  customTile("Total Amount", '', widget.totalAmount),
                  if (isOpen)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () => widget.onConfirmTap(),
                            child: Text(
                              "Confirm",
                              style: AppDecoration.textStyle(
                                color: AppColors.yellow,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        SizedBox(
                          height: 30.h,
                          child: const VerticalDivider(
                            thickness: 2.5,
                            color: AppColors.hintColor,
                          ),
                        ),
                        TextButton(
                            onPressed: () => widget.onCancelTap(),
                            child: Text(
                              "Cancel",
                              style: AppDecoration.textStyle(
                                color: AppColors.yellow,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    )
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class BookingCard extends StatefulWidget {
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
  const BookingCard({
    Key? key,
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
  }) : super(key: key);

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  bool isOpen = false;

  Widget customTile(String leadingTxt, String titleTxt, trailingTxt) => Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
              width: 80.h,
              child: Text(
                leadingTxt,
                style: AppDecoration.textStyle(
                  color: AppColors.yellow,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (trailingTxt == null)
              SizedBox(
                height: 30.h,
                width: 220.w,
                child: (leadingTxt == "Product")
                    ? RichText(
                        text: TextSpan(
                            text: "${widget.productName} (",
                            style: AppDecoration.textStyle(
                              color: AppColors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: widget.productSize,
                                style: AppDecoration.textStyle(
                                  color: AppColors.yellow,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const TextSpan(text: ")"),
                            ]),
                      )
                    : Text(
                        (leadingTxt == "Amount" && trailingTxt == null)
                            ? "₹$titleTxt"
                            : titleTxt,
                        style: AppDecoration.textStyle(
                          color: AppColors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            (trailingTxt == null)
                ? const Center()
                : Container(
                    alignment: Alignment.topRight,
                    height: 26.h,
                    width: 200.h,
                    child: Text(
                      (leadingTxt == "Reward Points")
                          ? "- ₹$trailingTxt"
                          : "₹$trailingTxt",
                      style: AppDecoration.textStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        FadeInLeft(
          child: Container(
            height: (isOpen) ? size.height * 0.2 : size.height * 0.226,
            width: size.width * 0.92,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.hintColor),
              borderRadius: BorderRadius.circular(19.0),
              color: AppColors.black,
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:
                            (isOpen) ? size.height * 0.15 : size.height * 0.2,
                        width: size.width * 0.73,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 6.h,
                            ),
                            customTile("Name", widget.customerName, null),
                            customTile("Product", widget.productName, null),
                            customTile(
                                "Appointment Timing", widget.dateTime, null),
                            if (isOpen == false)
                              customTile("Amount", widget.amount, null),
                          ],
                        ),
                      ),
                      if (isOpen == false)
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isOpen = !isOpen;
                              });
                              print(isOpen);
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.hintColor,
                              size: 35.sp,
                            )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isOpen)
          FadeInLeft(
            child: Container(
              height: size.height * 0.4,
              width: size.width * 0.92,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.hintColor),
                borderRadius: BorderRadius.circular(19.0),
                color: AppColors.black,
              ),
              child: Column(
                children: [
                  if (isOpen)
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              isOpen = !isOpen;
                            });
                          },
                          icon: Transform.rotate(
                            angle: 4.7,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.hintColor,
                              size: 35.sp,
                            ),
                          )),
                    ),
                  customTile("Email", widget.email, null),
                  customTile("Address", widget.address, null),
                  SizedBox(
                    height: 3.h,
                  ),
                  customTile("Amount", '', widget.amount),
                  customTile(
                      "Taxes & Service Charges", '', widget.taxServiceCharge),
                  customTile("Reward Points", '', widget.rewardPoints),
                  customTile("Convenience Fee", '', widget.convenienceFees),
                  SizedBox(
                    height: 3.h,
                  ),
                  customTile("Total Amount", '', widget.totalAmount),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
