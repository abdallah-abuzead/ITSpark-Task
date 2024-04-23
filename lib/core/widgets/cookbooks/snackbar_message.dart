import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class SnackBarMessage {
  static void showSuccessSnackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
        backgroundColor: AppColors.success.shade400,
      ),
    );
  }

  static void showErrorSnackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
        backgroundColor: AppColors.error,
      ),
    );
  }

  static void showWarningSnackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
        backgroundColor: AppColors.warning,
      ),
    );
  }
}
