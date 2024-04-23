import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';

class StudentPictureField extends StatelessWidget {
  const StudentPictureField({Key? key, required this.pickedImagePath, required this.onPick}) : super(key: key);
  final String pickedImagePath;
  final Function(String path) onPick;

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) onPick(pickedFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return pickedImagePath.isEmpty
        ? InkWell(
            onTap: () => pickImage(),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              color: AppColors.border.shade400,
              dashPattern: const [4],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      const Icon(Icons.filter),
                      const SizedBox(height: 16),
                      AppText('add_student_picture'.tr(), fontSize: 12),
                      const SizedBox(height: 8),
                      AppText('browse_files'.tr(), fontSize: 12, color: AppColors.primary),
                    ],
                  ),
                ),
              ),
            ),
          )
        : InkWell(
            onTap: () => pickImage(),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: FileImage(File(pickedImagePath)), fit: BoxFit.cover),
              ),
            ),
          );
  }
}
