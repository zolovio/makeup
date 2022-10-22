import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/theme.dart';

import 'app_decoration.dart';

class CategoryAnimatedCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final Widget child;
  const CategoryAnimatedCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.child})
      : super(key: key);

  @override
  State<CategoryAnimatedCard> createState() => _CategoryAnimatedCardState();
}

class _CategoryAnimatedCardState extends State<CategoryAnimatedCard> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: isOpen
            ? FadeInDown(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: size.height * 0.10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(widget.imageUrl).image)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                height: 60.h,
                                width: 60.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.grey, width: 1.2),
                                  image: DecorationImage(
                                    image: Image.asset(widget.imageUrl).image,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      widget.child,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isOpen = !isOpen;
                                  });
                                },
                                icon: Icon(
                                  isOpen
                                      ? Icons.keyboard_arrow_up_rounded
                                      : Icons.keyboard_arrow_down_rounded,
                                  size: 50.sp,
                                  color: AppColors.hintColor,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            : FadeInLeft(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 80.h,
                                width: 70.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: Image.asset(widget.imageUrl).image,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            widget.title,
                            textAlign: TextAlign.center,
                            style: AppDecoration.textStyle(
                              color: AppColors.black,
                              fontSize: 30.sp,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                isOpen = !isOpen;
                              });
                            },
                            icon: Icon(
                              isOpen
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              size: 50.sp,
                              color: AppColors.hintColor,
                            )),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
