import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/common_drawer.dart';
import 'package:makeup/src/core/ui/theme.dart';

class BaseScreen extends StatefulWidget {
  final TextEditingController searchController;
  final Widget child;
  const BaseScreen(
      {Key? key, required this.searchController, required this.child})
      : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  bool isSearchExpand = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.black,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: Image.asset('assets/logo.png', width: size.width * 0.6.w),
            ),
            Expanded(
              child: Scaffold(
                backgroundColor: AppColors.black,
                drawer: CommonDrawer(),
                appBar: AppBar(
                  backgroundColor: AppColors.black,
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Image.asset('assets/side_bar_yellow.png'),
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context)
                            .openAppDrawerTooltip,
                      );
                    },
                  ),
                  title: AnimatedContainer(
                    height: size.height * 0.05.h,
                    width: isSearchExpand ? size.width * 0.9.w : 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border:
                            Border.all(color: AppColors.yellow, width: 1.5)),
                    duration: const Duration(milliseconds: 800),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSearchExpand = !isSearchExpand;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.all(2.sp),
                            child: Icon(
                              Icons.search_rounded,
                              color: AppColors.yellow,
                              size: 45.sp,
                            ),
                          ),
                        ),
                        isSearchExpand
                            ? Flexible(
                                child: TextField(
                                style: AppDecoration.textStyle(
                                  color: AppColors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                controller: widget.searchController,
                              ))
                            : Container()
                      ],
                    ),
                  ),
                  actions: [
                    !isSearchExpand
                        ? FadeInUp(
                            duration: const Duration(milliseconds: 800),
                            delay: const Duration(milliseconds: 100),
                            child: Row(
                              children: [
                                !isSearchExpand
                                    ? Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Image.asset(
                                            'assets/facebook_yellow.png'),
                                      )
                                    : Container(),
                                !isSearchExpand
                                    ? Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Image.asset(
                                            'assets/insta_yellow.png'),
                                      )
                                    : Container(),
                                !isSearchExpand
                                    ? Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Image.asset(
                                            'assets/twitter_yellow.png'),
                                      )
                                    : Container(),
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
                body: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
