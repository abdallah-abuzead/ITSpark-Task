import 'package:flutter/material.dart';
import 'package:itspark/core/constants/app_locale.dart';

import '../../constants/app_colors.dart';
import '../app_text.dart';

class SettingHeaderWidget extends StatelessWidget {
  const SettingHeaderWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: AppLocale.isEnglish ? Alignment.centerLeft : Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: AppColors.background,
      child: AppText(
        title,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.text.shade300,
      ),
    );
  }
}
