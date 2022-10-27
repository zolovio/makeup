import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:makeup/src/core/ui/common_widget/app_decoration.dart';
import 'package:makeup/src/core/ui/common_widget/image_picker_dep.dart';
import 'package:makeup/src/core/ui/theme.dart';

class CircularAvatar extends StatelessWidget {
  final String url;
  final String placeHolderLocation;
  final double avatarSize;
  final bool isImageEditable;
  final Function? onCropImage;

  CircularAvatar({
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
        return AlertDialog(
          title: Text("Do you want to crop the image?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
          actions: [
            Padding(
              padding: EdgeInsets.all(4.h),
              child: SizedBox(
                // height: 40.h,
                width: 75.w,
                child: TextButton(
                  child: Text(
                    'Yes',
                    style: AppDecoration.textStyle(
                      color: AppColors.black,
                      fontSize: 25.sp,
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
                      color: AppColors.black,
                      fontSize: 25.sp,
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
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Image",
                style: AppDecoration.textStyle(
                  color: AppColors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColor,
                  )),
            ],
          ),
          content: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(4.h),
                child: SizedBox(
                  child: OutlinedButton(
                    child: Text(
                      'Camera',
                      style: AppDecoration.textStyle(
                        color: AppColors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () => getImageFromCamera(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.h),
                child: SizedBox(
                  child: OutlinedButton(
                    child: Text(
                      'Gallery',
                      style: AppDecoration.textStyle(
                        color: AppColors.black,
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
          actions: [],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
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
        isImageEditable
            ? Positioned(
                bottom: size.height * 0.001.h,
                right: size.width * 0.29.w,
                child: GestureDetector(
                  onTap: () {
                    alert(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(4.h),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                          border:
                              Border.all(color: AppColors.yellow, width: 1.5)),
                      child: Padding(
                        padding: EdgeInsets.all(4.h),
                        child: const Icon(Icons.edit, color: AppColors.yellow),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
