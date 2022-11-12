import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class BannerTiles extends StatefulWidget {
  final bool? isReward;
  final TextEditingController controller;
  final String title;
  const BannerTiles(
      {Key? key,
      required this.controller,
      required this.title,
      this.isReward = false})
      : super(key: key);

  @override
  State<BannerTiles> createState() => _BannerTilesState();
}

class _BannerTilesState extends State<BannerTiles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, left: 18.h, right: 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (widget.isReward == true)
              ? Container(
                  alignment: Alignment.center,
                  height: 90.h,
                  width: 110.h,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: AppDecoration.textStyle(
                        fontSize: 22.h,
                        color: AppColors.yellow,
                        fontWeight: FontWeight.w600),
                  ),
                )
              : Text(
                  widget.title,
                  style: AppDecoration.textStyle(
                      fontSize: 22.h,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.w600),
                ),
          Container(
            alignment: Alignment.center,
            height: (widget.isReward == true) ? 50.h : 60.h,
            width: 80.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.hintColor),
              boxShadow: [
                BoxShadow(
                  color: AppColors.white,
                  blurRadius: 2.h,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.h, right: 5.h),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: (widget.isReward == true)
                      ? Icon(
                          Icons.percent,
                          color: AppColors.yellow,
                          size: 18.h,
                        )
                      : null,
                ),
                cursorColor: AppColors.yellow,
                maxLines: (widget.isReward == true) ? 1 : 5,
                style: TextStyle(color: AppColors.white, fontSize: 18.h),
                controller: widget.controller,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PriceBannerTiles extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  const PriceBannerTiles({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  @override
  State<PriceBannerTiles> createState() => _PriceBannerTilesState();
}

class _PriceBannerTilesState extends State<PriceBannerTiles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h, left: 18.h, right: 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: 50.h,
            width: 100.h,
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: AppDecoration.textStyle(
                  fontSize: 18.h,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 35.h,
            width: 60.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.hintColor),
              boxShadow: [
                BoxShadow(
                  color: AppColors.white,
                  blurRadius: 2.h,
                )
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.currency_rupee_rounded,
                    color: AppColors.yellow, size: 18),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      isDense: true,
                    ),
                    cursorColor: AppColors.yellow,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: AppColors.white, fontSize: 18),
                    controller: widget.controller,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
