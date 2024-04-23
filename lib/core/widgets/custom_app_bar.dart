import 'package:flutter/material.dart';

import '../app_routes/app_router.dart';
import '../constants/app_colors.dart';
import 'app_text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  const CustomAppBar({required this.title, this.showBackButton = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            !showBackButton
                ? Container()
                : IconButton(
                    onPressed: () => AppRouter.back(),
                    icon: const Icon(Icons.arrow_back_ios, color: AppColors.text, size: 18),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    constraints: const BoxConstraints(maxWidth: 18),
                  ),
            GestureDetector(
              onTap: () => !showBackButton ? null : AppRouter.back(),
              child: AppText(title, fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
