import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../constants/app_locale.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  final bool isSignOut;
  final bool isLang;
  const SettingItem({
    required this.title,
    required this.icon,
    this.onTap,
    this.isSignOut = false,
    this.isLang = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: AppColors.text.shade400.withOpacity(0.9), size: 22),
            const SizedBox(width: 14),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSignOut ? AppColors.text.shade300 : AppColors.text.shade400,
              ),
            ),
            const Spacer(),
            isLang
                ? Text(
                    AppLocale.isEnglish ? 'العربية' : 'English',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppLocale.isEnglish ? AppFontFamilies.cairo : AppFontFamilies.inter,
                    ),
                  )
                : Container(),
            SizedBox(width: isLang ? 15 : 0),
            isSignOut ? Container() : Icon(Icons.arrow_forward_ios, color: AppColors.text.shade400, size: 16),
          ],
        ),
      ),
    );
  }
}
