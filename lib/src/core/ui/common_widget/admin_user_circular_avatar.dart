import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/image_picker_dep.dart';
import 'package:makeup/src/core/ui/theme.dart';

class UserCircularAvatar extends StatelessWidget {
  final String url;
  final String placeHolderLocation;
  final double avatarSize;
  final bool isImageEditable;
  final Function? onCropImage;

  UserCircularAvatar({
    Key? key,
    required this.url,
    required this.placeHolderLocation,
    this.avatarSize = 60,
    this.isImageEditable = false,
    this.onCropImage,
  }) : super(key: key);

  File? _image;

  Future<void> _cropImage(path) async {
    if (path != null) {
      CachedNetworkImage.evictFromCache(url);
      onCropImage!(File(path));
    }
  }

  Future cropAlert(context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: AppColors.hintColor,
                ),
                color: AppColors.black),
            height: 125.h,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15, 2),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Do you want to crop the image?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: AppColors.white)),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.h),
                          child: SizedBox(
                            // height: 40.h,
                            width: 75.w,
                            child: TextButton(
                              child: Text(
                                'Yes',
                                style: AppDecoration.textStyle(
                                  color: AppColors.yellow,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                _cropImage(_image!.path);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.h),
                          child: SizedBox(
                            // height: 40.h,
                            width: 75.w,
                            child: TextButton(
                              child: Text(
                                'No',
                                style: AppDecoration.textStyle(
                                  color: AppColors.yellow,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }

  ImagePickerDep _imagePickerDep = ImagePickerDep();

  Future<void> getImageFromCamera(context) async {
    final pickedImage = await _imagePickerDep.pickImageFromCamera();
    _image = pickedImage != null ? File(pickedImage[0].path) : null;
    if (_image != null) {
      Navigator.of(context).pop();

      cropAlert(context);
    }
  }

  Future getImageFromGallery(context) async {
    final pickedImage = await _imagePickerDep.pickImageFromGallery();
    _image = pickedImage != null ? File(pickedImage[0].path) : null;
    if (_image != null) {
      Navigator.of(context).pop();
      // _cropImage(_image.path);
      cropAlert(context);
    }
  }

  Future alert(context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: AppColors.hintColor,
                ),
                color: AppColors.black),
            height: 140.h,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Image",
                        style: AppDecoration.textStyle(
                          color: AppColors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.yellow,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.h),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: AppColors.hintColor,
                              ),
                              color: AppColors.black),
                          child: OutlinedButton(
                            child: Text(
                              'Camera',
                              style: AppDecoration.textStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () => getImageFromCamera(context),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.h),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: AppColors.hintColor,
                              ),
                              color: AppColors.black),
                          child: OutlinedButton(
                            child: Text(
                              'Gallery',
                              style: AppDecoration.textStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () => getImageFromGallery(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: !isImageEditable
          ? null
          : () {
              alert(context);
            },
      child: Stack(
        children: [
          CachedNetworkImage(
            placeholder: (context, url) => SpinKitCircle(
              color: Theme.of(context).primaryColor,
              size: avatarSize,
            ),
            errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: avatarSize + avatarSize,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.black,
                    border: Border.all(color: AppColors.yellow, width: 2.5)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      placeHolderLocation,
                      color: AppColors.yellow,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            fit: BoxFit.contain,
            imageUrl: url,
            imageBuilder: (context, imageProvider) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 2 * avatarSize,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(color: AppColors.yellow, width: 2.5),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(url,
                            maxHeight: 100, maxWidth: 100),
                        fit: BoxFit.none,
                      )),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
