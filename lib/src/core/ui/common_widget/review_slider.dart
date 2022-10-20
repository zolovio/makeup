import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class ReviewSlider extends StatelessWidget {
  const ReviewSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
      ),
      items: [1, 2, 3, 4]
          .map((item) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 40.r,
                                width: 40.r,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.hintColor,
                                    width: 1.5,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.r),
                                  child: Image.asset('assets/person_icon.png'),
                                ),
                              ),
                              Text(
                                'Paul',
                                style: AppDecoration.textStyle(
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '* I wanted to check in about any feedback you might have – just a few sentences describing your experience with us, how you benefit from using product, or whatever comes to mind.*',
                            style: AppDecoration.textStyle(
                              color: AppColors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                      ],
                    )),
              ))
          .toList(),
    );
  }
}
