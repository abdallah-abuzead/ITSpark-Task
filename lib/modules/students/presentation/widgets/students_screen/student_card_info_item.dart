import 'package:flutter/material.dart';
import 'package:itspark/core/constants/app_locale.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';

class StudentCardInfoItem extends StatelessWidget {
  const StudentCardInfoItem({super.key, required this.title, required this.value, this.isClass = false});

  final String title;
  final String value;
  final bool isClass;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: AppLocale.isEnglish ? 40 : 65,
          child: AppText(title, fontWeight: FontWeight.w800, color: AppColors.secondary.shade600),
        ),
        AppText(':', fontWeight: FontWeight.w800, color: AppColors.secondary.shade600),
        const SizedBox(width: 15),
        Expanded(
          child: AppText(
            value,
            fontWeight: FontWeight.w500,
            color: isClass ? AppColors.tertiary.shade900 : AppColors.text.shade400,
          ),
        ),
      ],
    );
  }
}
