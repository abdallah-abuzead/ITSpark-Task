import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itspark/core/app_routes/app_router.dart';
import 'package:itspark/core/constants/assets/app_images.dart';
import 'package:itspark/core/widgets/app_button.dart';
import 'package:itspark/modules/students/presentation/bloc/add_update_delete_student/add_update_delete_student_bloc.dart';
import 'package:itspark/modules/students/presentation/screens/add_update_student_screen.dart';
import 'package:itspark/modules/students/presentation/widgets/students_screen/student_card_info_item.dart';
import 'package:itspark/modules/students/presentation/widgets/students_screen/student_card_vertical_info_item.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/app_functions.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../domain/entities/student.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRouter.to(AddUpdateStudentScreen(student: student)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: student.image == null
                                  ? const AssetImage(AppImages.avatar) as ImageProvider
                                  : FileImage(File(student.image!)),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppButton(
                        title: 'delete'.tr(),
                        icon: const Icon(Icons.delete, size: 20),
                        backgroundColor: AppColors.secondary,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          AppFunctions.deleteFile(student.image);
                          context.read<AddUpdateDeleteStudentBloc>().add(DeleteStudentEvent(id: student.id));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        student.name,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary.shade800,
                        fontSize: 16,
                      ),
                      const SizedBox(height: 12),
                      StudentCardInfoItem(title: 'id'.tr(), value: student.id),
                      const SizedBox(height: 10),
                      StudentCardInfoItem(title: 'class'.tr(), value: student.studyClass.tr(), isClass: true),
                      const SizedBox(height: 10),
                      StudentCardInfoItem(title: 'dob'.tr(), value: student.dateOfBirth),
                      SizedBox(height: student.phone == null && student.notes == null ? 0 : 10),
                      student.phone == null
                          ? Container()
                          : StudentCardInfoItem(title: 'mobile'.tr(), value: student.phone!),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                StudentCardVerticalInfoItem(title: 'address'.tr(), value: student.address),
                const SizedBox(width: 30),
                student.notes == null
                    ? Container()
                    : StudentCardVerticalInfoItem(title: 'notes'.tr(), value: student.notes!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
