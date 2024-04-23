import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';

class StudentCardVerticalInfoItem extends StatelessWidget {
  const StudentCardVerticalInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(title, fontWeight: FontWeight.w800, color: AppColors.secondary.shade600),
          const SizedBox(height: 6),
          AppText(
            value,
            fontWeight: FontWeight.w500,
            color: AppColors.text.shade400,
          ),
        ],
      ),
    );
  }
}
