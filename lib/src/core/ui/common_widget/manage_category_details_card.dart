import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/theme.dart';

import '../../../admin/features/manage_categories/manage_category_details/confirm_edit_dialog.dart';
import 'app_decoration.dart';

class EditCategoryCard extends StatefulWidget {
  final String isSame;
  final String imageUrl;
  final String title;
  final String samePrice;
  final String shoulderPrice;
  final String mediumPrice;
  final String longPrice;
  final Function onEditPressed;

  const EditCategoryCard({
    Key? key,
    required this.isSame,
    required this.imageUrl,
    required this.title,
    required this.samePrice,
    required this.shoulderPrice,
    required this.mediumPrice,
    required this.longPrice,
    required this.onEditPressed,
  }) : super(key: key);

  @override
  State<EditCategoryCard> createState() => _EditCategoryCardState();
}

class _EditCategoryCardState extends State<EditCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FadeInLeft(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.black,
              border: Border.all(color: AppColors.yellow)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50.h,
                        width: 40.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: Image.asset(widget.imageUrl).image,
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: AppDecoration.textStyle(
                        color: AppColors.white,
                        fontSize: 20.sp,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  (widget.isSame == "Yes")
                      ? Container(
                          height: 25.h,
                          width: 80.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.black,
                              border: Border.all(color: AppColors.yellow)),
                          child: RichText(
                            text: TextSpan(
                                text: "₹",
                                style: AppDecoration.textStyle(
                                    color: AppColors.yellow,
                                    fontWeight: FontWeight.w600),
                                children: [
                                  TextSpan(
                                      text: widget.samePrice,
                                      style: AppDecoration.textStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600)),
                                ]),
                          ),
                        )
                      : Container(
                          height: 50.h,
                          width: 65.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.black,
                              border: Border.all(color: AppColors.yellow)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "S   -  ",
                                      style: AppDecoration.textStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "₹",
                                          style: AppDecoration.textStyle(
                                              color: AppColors.yellow,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                          children: [
                                            TextSpan(
                                                text: widget.shoulderPrice,
                                                style: AppDecoration.textStyle(
                                                    color: AppColors.white,
                                                    fontSize: 15.sp,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ]),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "M   -  ",
                                      style: AppDecoration.textStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "₹",
                                          style: AppDecoration.textStyle(
                                              color: AppColors.yellow,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                          children: [
                                            TextSpan(
                                                text: widget.mediumPrice,
                                                style: AppDecoration.textStyle(
                                                    color: AppColors.white,
                                                    fontSize: 15.sp,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ]),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "L   -  ",
                                      style: AppDecoration.textStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "₹",
                                          style: AppDecoration.textStyle(
                                              color: AppColors.yellow,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                          children: [
                                            TextSpan(
                                                text: widget.longPrice,
                                                style: AppDecoration.textStyle(
                                                    color: AppColors.white,
                                                    fontSize: 15.sp,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                  IconButton(
                      onPressed: () => widget.onEditPressed(),
                      icon: Icon(
                        CupertinoIcons.pencil_circle,
                        size: 40.sp,
                        color: AppColors.yellow,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
