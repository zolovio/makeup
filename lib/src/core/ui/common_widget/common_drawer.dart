import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makeup/app.dart';
import 'package:makeup/src/core/services/app_router.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.black,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  child: CachedNetworkImage(
                      width: 50.0,
                      height: 50.0,
                      imageUrl:
                          'https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
                ),
                SizedBox(width: 15.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250.w,
                      child: Text(
                        'Alina Johnson',
                        style: AppDecoration.textStyle(
                          color: AppColors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'alina@gmail.com',
                      style: AppDecoration.textStyle(
                        color: AppColors.hintColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 200.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: const LinearProgressIndicator(
                          color: AppColors.yellow,
                          value: 0.6,
                          backgroundColor: AppColors.hintColor,
                        ),
                      ),
                    ),
                    Text(
                      'Your profile is 60% complete',
                      style: AppDecoration.textStyle(
                        color: AppColors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigatorKey.currentState?.pushNamed(AppRouter.profile);
                      },
                      child: Text(
                        'View/Edit profile',
                        style: AppDecoration.textStyle(
                          color: AppColors.yellow,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/menu_account.png',
              width: 35.w,
              height: 35.w,
            ),
            title: Text(
              'My Account',
              style: AppDecoration.textStyle(
                color: AppColors.yellow,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(
              'assets/menu_booking.png',
              width: 35.w,
              height: 35.w,
            ),
            title: Text(
              'My Bookings',
              style: AppDecoration.textStyle(
                color: AppColors.yellow,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(
              'assets/menu_home.png',
              width: 35.w,
              height: 35.w,
            ),
            title: Text(
              'Home',
              style: AppDecoration.textStyle(
                color: AppColors.yellow,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(
              'assets/menu_rate.png',
              width: 35.w,
              height: 35.w,
            ),
            title: Text(
              'Rate List',
              style: AppDecoration.textStyle(
                color: AppColors.yellow,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(
              'assets/menu_cart.png',
              width: 35.w,
              height: 35.w,
            ),
            title: Text(
              'Book Now',
              style: AppDecoration.textStyle(
                color: AppColors.yellow,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(
              'assets/menu_contact.png',
              width: 35.w,
              height: 35.w,
            ),
            title: Text(
              'Contact Us',
              style: AppDecoration.textStyle(
                color: AppColors.yellow,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
