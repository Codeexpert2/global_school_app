import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:global_school/core/constants/images.dart';
import 'package:global_school/core/extensions/extensions.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/utils/bottom_sheets.dart';

import 'cached_image.dart';

typedef SaveCallback = void Function(String imageUrl);

class AvatarPicker extends StatefulWidget {
  const AvatarPicker({
    super.key,
    this.isFull = true,
    required this.initImageUrl,
    required this.onImagePicked,
  });
  final bool isFull;
  final String initImageUrl;
  final SaveCallback onImagePicked;

  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  final _picker = ImagePicker();

  late String image;

  @override
  void initState() {
    super.initState();
    image = widget.initImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isFull ? context.width * 0.4 : context.width * 0.15,
      height: widget.isFull ? context.width * 0.4 : context.width * 0.15,
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: AppColors.shadowColor,
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: widget.isFull ? context.width * 0.4 : context.width * 0.15,
            height: widget.isFull ? context.width * 0.4 : context.width * 0.15,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
            ),
            // width: double.infinity,
            child: image.isEmptyOrNull
                ? Image.asset(
                    AppImages.imagesProfilePlaceholder,
                    fit: BoxFit.cover,
                  )
                : image.isURLImage
                    ? CachedImage(
                        imageUrl: image,
                      )
                    : Image.file(
                        File(image),
                        fit: BoxFit.cover,
                      ),
          ),
          if (widget.isFull)
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: showOptions,
                child: Container(
                  width: 50,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 2,
                          color: AppColors.shadowColor,
                          offset: Offset(1, 1),
                        )
                      ]),
                  child: const Icon(
                    Icons.edit,
                    color: AppColors.primary700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    if (pickedFile == null) return;

    widget.onImagePicked(pickedFile.path);
  }

  void showOptions() => openModalBottomSheet(
        context,
        <Widget>[
          ListTile(
            onTap: () async {
              closeModalBottomSheet(context);
              await _pickImage(ImageSource.camera);
            },
            leading: const Icon(Icons.photo_camera),
            title: const Text('التقط صورة من الكاميرا'),
          ),
          ListTile(
            onTap: () async {
              closeModalBottomSheet(context);
              await _pickImage(ImageSource.gallery);
            },
            leading: const Icon(Icons.photo),
            title: const Text('إختر صورة من المعرض'),
          ),
          const SizedBox(height: kTextTabBarHeight),
        ],
      );
}
