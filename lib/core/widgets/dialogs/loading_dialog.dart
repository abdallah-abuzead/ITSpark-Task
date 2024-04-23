import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app_text.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;

  const LoadingDialog({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 35, bottom: 30),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      content: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  message ?? '${'please_wait'.tr()}...',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
