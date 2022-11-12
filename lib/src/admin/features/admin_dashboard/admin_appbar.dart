import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/src/admin/features/admin_dashboard/admin_drawer.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class AdminAppBar extends StatefulWidget {
  final TextEditingController searchController;
  final bool? showText;
  final Widget child;
  const AdminAppBar({
    Key? key,
    required this.searchController,
    required this.child,
    this.showText,
  }) : super(key: key);

  @override
  State<AdminAppBar> createState() => _AdminAppBarState();
}

class _AdminAppBarState extends State<AdminAppBar> {
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
                drawer: (true == widget.showText) ? null : const AdminDrawer(),
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.black,
                  leading: (true == widget.showText)
                      ? null
                      : Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              icon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child:
                                    Image.asset('assets/side_bar_yellow.png'),
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              tooltip: MaterialLocalizations.of(context)
                                  .openAppDrawerTooltip,
                            );
                          },
                        ),
                  title: (true == widget.showText)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: size.height * 0.05.h,
                              width: size.width * 0.40.h,
                              child: Text(
                                "List of Users",
                                style: TextStyle(
                                    color: AppColors.yellow,
                                    fontSize: 25.h,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            AnimatedContainer(
                              height: size.height * 0.05.h,
                              width: (isSearchExpand && widget.showText != true)
                                  ? size.width * 0.9.w
                                  : (isSearchExpand && widget.showText == true)
                                      ? size.width * 0.55.w
                                      : 150.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      color: AppColors.yellow, width: 1.5)),
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
                          ],
                        )
                      : AnimatedContainer(
                          height: size.height * 0.05.h,
                          width: isSearchExpand ? size.width * 0.9.w : 150.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: AppColors.yellow, width: 1.5)),
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
