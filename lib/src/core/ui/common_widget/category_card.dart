import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String label;
  final Function onCardTap;
  final double? fontSize;
  const CategoryCard(
      {Key? key,
      required this.imageUrl,
      required this.label,
      required this.onCardTap,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCardTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.white, width: 1.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white24,
                spreadRadius: 10.r,
                blurRadius: 30.r,
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                imageUrl,
              ).image,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      label,
                      style: AppDecoration.textStyle(
                        color: AppColors.yellow,
                        fontSize: fontSize ?? 20.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
